import http from '@ohos.net.http';
import Logger from '../utils/Logger';
import { ApiResult } from './ApiResult';
import { httpUtil } from './HttpUtil';
import { DecodingOptions, RequestOptions } from './RequestOptions';
type FunParamMapKey = {
  target: Object;
  methodName: string;
  index: number;
}

let funParamMap = new Map<string, string>();

export function Get(url: string) {
  return function (target: any, methodName: string, descriptor: PropertyDescriptor) {
    const originalMethod = descriptor.value;
    let URL: string = url;
    let map: Map<string, string> = new Map();
    let options: RequestOptions = {
      queryParams: map
    };
    descriptor.value = async function (...args: any[]) {
      args.forEach((arg, index) => {
        let obj: FunParamMapKey = {target: target, methodName: methodName, index: index};
        let paramName = funParamMap[JSON.stringify(obj)];
        console.log('param:', paramName)
        Logger.debug("Aop", "param:" + paramName)
        if (typeof paramName !== 'undefined') {
          if (typeof arg === 'string' || typeof arg === 'object' || arg instanceof ArrayBuffer || typeof arg === 'number') {
            options.queryParams[paramName] = arg;
          } else {
            console.error('parameter is error')
            throw new Error(`Invalid parameter type at index ${index}.`)
          }
        }
      });
      const urlParams = Object.keys(options.queryParams).map(key => `${key}=${options.queryParams[key]}`).join('&')
      console.log('urlParams:', urlParams)
      Logger.debug("Aop", "urlParams:" + urlParams)
      if (URL.includes("?")) {
        url = `${URL}${urlParams}`
      } else {
        url = `${URL}?${urlParams}`
      }
      const p = new Promise<ApiResult>((resolve, reject) => {
        httpUtil.Get(url, options).then((response) => {
          const result: ApiResult = response;
          resolve(result);
        }).catch((error) => {
          reject(error);
        });
      });
      return await p;

    }
  }
}


export function Post(url: string) {
  return function (target: any, methodName: string, descriptor: PropertyDescriptor) {
    const originalMethod = descriptor.value;
    let URL: string = url;
    let options: RequestOptions = {
      extraData:{}
    };
    descriptor.value = async function (...args: any[]) {
      args.forEach((arg, index) => {
        console.log("parameter:" + JSON.stringify(arg))
        Logger.debug("Aop", "args:" + JSON.stringify(arg))
        let obj: FunParamMapKey = {target: target, methodName: methodName, index: index};
        let paramName = funParamMap[JSON.stringify(obj)];
        console.log('param:', paramName)
        Logger.debug("Aop", "param:" + paramName)
        if (typeof paramName !== 'undefined') {
          if (typeof arg === 'string' || typeof arg === 'object' || arg instanceof ArrayBuffer) {
            options.extraData[paramName] = arg;
          } else {
            throw new Error(`Invalid parameter type at index ${index}.`)
          }
        } else {
          if (arg instanceof DecodingOptions) {
            options.decodingOptions = arg
          } else if (typeof arg == 'object') {
            options.extraData = JSON.stringify(arg)
          }
        }
      });

      console.log('extraData', JSON.stringify(options.extraData))
      const p = new Promise<ApiResult>((resolve, reject) => {
        httpUtil.Post(URL, options).then((response) => {
          const result: ApiResult = response;
          resolve(result);
        }).catch((error) => {
          reject(error);
        });
      });
      return await p;
    }
  }
}

export function Param(paramName: string) {
  return function (target: any, methodName: string, parameterIndex: number) {
    let obj: FunParamMapKey = {target: target, methodName: methodName, index: parameterIndex};
    funParamMap[JSON.stringify(obj)] = paramName;
  };
}