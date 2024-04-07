import http from '@ohos.net.http';
import preferenceUtils from './PreferencesUtil';
export default async function httpPost(url: string, data?: any) {

  let httpRequest = http.createHttp();
  let options = {
    method: http.RequestMethod.POST,
    header: {
      'Content-Type': 'application/json'
    },
    extraData: data,
    readTimeout: 60000,
    connectTimeout: 60000
  } as http.HttpRequestOptions;
  let response = await httpRequest.request(url, options);
  return response;
}

// export async function httpPostWithToken(url: string, token?: string) {
//   if (!url) {
//     return undefined;
//   }
//   let dataList: any = []
//   let httpRequest = http.createHttp();
//   let options = {
//     method: http.RequestMethod.POST,
//     header: {
//       'Content-Type': 'application/json',
//       'Authorization': token
//     },
//     readTimeout: 60000,
//     connectTimeout: 60000
//   } as http.HttpRequestOptions;
//   let response = httpRequest.request(url, options);
//   await response.then((data) => {
//     let code = JSON.parse(data.result.toString()).code;
//     if (data.responseCode == 200 && code == 200) {
//       dataList = JSON.parse(data.result.toString()).data['siteList']
//     }
//   }).catch((err) => {
//     console.info('myTest-error:' + JSON.stringify(err));
//   });
//   httpRequest.destroy()
//   return dataList;
// }



export async function httpPostWithToken(url: string, body?: any) {
  return new Promise(async (resolve, reject) => {
    const token = (await preferenceUtils.get("token", "")).toString();
    const httpRequest = http.createHttp();
    const options = {
      method: http.RequestMethod.POST,
      header: {
        'Content-Type': 'application/json',
        'Authorization': token?token:undefined
      },
      readTimeout: 60000,
      connectTimeout: 60000
    } as http.HttpRequestOptions;
    const data: any = await httpRequest.request(url, options).catch((err: any) => {
      console.log("error!!!")
      return ({"code": 500, result: err.message})
    })
    httpRequest.destroy()
    resolve(JSON.parse(data.result.toString()).data['siteList']);
  })


  // if (!url) {
  //   return undefined;
  // }
  // let dataList: any = []
  // let httpRequest = http.createHttp();
  // let options = {
  //   method: http.RequestMethod.POST,
  //   header: {
  //     'Content-Type': 'application/json',
  //     'Authorization': token?token:undefined
  //   },
  //   readTimeout: 60000,
  //   connectTimeout: 60000
  // } as http.HttpRequestOptions;
  // let response = httpRequest.request(url, options);
  // await response.then((data) => {
  //   let code = JSON.parse(data.result.toString()).code;
  //   if (data.responseCode == 200 && code == 200) {
  //     dataList = JSON.parse(data.result.toString()).data['siteList']
  //   }
  // }).catch((err) => {
  //   console.info('myTest-error:' + JSON.stringify(err));
  // });
  // httpRequest.destroy()
  // return dataList;
}

// export async function Post(url: string, bodyData?: string | Object | ArrayBuffer) {
//   let httpRequest = http.createHttp();
//   httpRequest.request(
//     url,
//     {
//       method: http.RequestMethod.POST,
//       header: {
//         'Content-Type': 'application/json'
//       },
//       extraData: bodyData,
//       connectTimeout: 60000, // 可选，默认为60s
//       readTimeout: 60000, // 可选，默认为60s
//     }, (err, data) => {
//       if (!err) {
//         let code = JSON.parse(data.result.toString()).code;
//         if (data.responseCode == 200 && code == 200) {
//           result = true;
//         }
//         // data.result为http响应内容，可根据业务需要进行解析
//         console.info('myTest-data:' + data);
//         console.info('myTest-Result:' + JSON.parse(data.result.toString()).code);
//         console.info('myTest-code:' + data.responseCode);
//         // data.header为http响应头，可根据业务需要进行解析
//         // console.info('myTest-header:' + JSON.stringify(data.header));
//         // console.info('myTest-cookies:' + data.cookies); // 8+
//       } else {
//         console.info('myTest-error:' + JSON.stringify(err));
//         // 该请求不再使用，调用destroy方法主动销毁。
//         httpRequest.destroy();
//       }
//   });
// }