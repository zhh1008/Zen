import http from '@ohos.net.http';
import Logger from '../utils/Logger';
import preferenceUtils from '../utils/PreferencesUtil';
import { ApiResult } from './ApiResult';
import { RequestOptions } from './RequestOptions';
export class HttpCore {
  request(url: string, requestOptions: RequestOptions): Promise<ApiResult> {
    let p = new Promise<ApiResult>(async (resolve, reject) => {
      let httpRequest = http.createHttp();
      let token: string = await getToken();
      let promise = httpRequest.request(url, {
        method: requestOptions.method,
        connectTimeout: 60000,
        readTimeout: 60000,
        header: {
          'Content-Type': 'application/json',
          'Authorization': token,
          'client_type': 'zen_harmonyOs'
        },
        extraData: requestOptions.extraData
      });
      promise.then((data) => {
        let resultObj = JSON.parse(data.result.toString());
        if (resultObj.code == 200) {
          if (resultObj.data.token != undefined) {
            preferenceUtils.set('token', resultObj.token)
          }
          console.log(JSON.stringify(resultObj))
          Logger.info("HttpCore", `[${url}]` + JSON.stringify(resultObj))
          resolve(resultObj);
        } else {
          resolve(resultObj);
        }
      }).catch((err) => {
        console.error('error:' + JSON.stringify(err))
        Logger.error("HttpCore", err)
        reject(err);
      });
      httpRequest.destroy();
    })
    return p;
  }
}

async function getToken(): Promise<string> {
  return new Promise<string>(async (resolve, reject) => {
    try {
      const data = await preferenceUtils.get('token', '');
      if (typeof data === 'string') {
        resolve(data);
      } else {
        reject(new Error('Invalid token'));
      }
    } catch(err) {
      reject(err);
    }
  })
}

export const httpCore = new HttpCore();