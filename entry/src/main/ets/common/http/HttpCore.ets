import http from '@ohos.net.http';
import image from '@ohos.multimedia.image';
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
          'client_type': 'zen_harmonyOs',
          'os': 'harmonyOs'
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
        console.error('error:' + err)
        Logger.error("HttpCore", err)
        reject(err);
      });
      httpRequest.destroy();
    })
    return p;
  }


  requestByImage(url: string, requestOptions: RequestOptions): Promise<PixelMap> {
    let p = new Promise<PixelMap>(async (resolve, reject) => {
      let httpRequest = http.createHttp();
      let token: string = await getToken();
      let promise = httpRequest.request(url, {
        method: requestOptions.method,
        connectTimeout: 60000,
        readTimeout: 60000,
        expectDataType: 2,
        header: {
          'Content-Type': 'application/json',
          'Authorization': token,
          'client_type': 'zen_harmonyOs',
          'os': 'harmonyOs'
        },
        extraData: requestOptions.extraData
      });
      promise.then((data) => {
        if (data.responseCode == 200) {
          let res: any = data.result
          let imageSource = image.createImageSource(res);
          imageSource.createPixelMap(requestOptions.decodingOptions.options).then((pixelMap) => {
            resolve(pixelMap)
          })
        }
      }).catch((err) => {
        Logger.error("HttpCore", err)
        reject(err);
      });
      httpRequest.destroy();
    })
    return p;
  }


  // requestByImage(url: string, requestOptions: RequestOptions): Promise<ArrayBuffer> {
  //   let p = new Promise<ArrayBuffer>(async (resolve, reject) => {
  //     let httpRequest = http.createHttp();
  //     let token: string = await getToken();
  //     let promise = httpRequest.request(url, {
  //       method: requestOptions.method,
  //       // responseType: 'arraybuffer',
  //       connectTimeout: 60000,
  //       readTimeout: 60000,
  //       expectDataType: 2,
  //       header: {
  //         'Content-Type': 'application/json',
  //         'Authorization': token,
  //         'client_type': 'zen_harmonyOs'
  //       },
  //       extraData: requestOptions.extraData
  //     }
  //     );
  //     promise.then((data) => {
  //       if (data.responseCode == 200) {
  //         resolve(data.result as ArrayBuffer)
  //       }
  //       // let resultObj = JSON.parse(data.result.toString());
  //       // if (resultObj.code == 200) {
  //       //   if (resultObj.data.token != undefined) {
  //       //     preferenceUtils.set('token', resultObj.token)
  //       //   }
  //       //   console.log(JSON.stringify(resultObj))
  //       //   Logger.info("HttpCore", `[${url}]` + JSON.stringify(resultObj))
  //       //   resolve(resultObj);
  //       // } else {
  //       //   resolve(resultObj);
  //       // }
  //     }).catch((err) => {
  //       console.error('error:' + err)
  //       Logger.error("HttpCore", err)
  //       reject(err);
  //     });
  //     httpRequest.destroy();
  //   })
  //   return p;
  // }
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