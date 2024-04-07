import http from '@ohos.net.http';
import { ApiResult } from './ApiResult';
import { httpCore } from './HttpCore';
import { RequestOptions } from './RequestOptions';
export class HttpUtil {
  private static mInstance: HttpUtil;
  private constructor() {
  }

  static getInstance(): HttpUtil {
    if (!HttpUtil.mInstance) {
      HttpUtil.mInstance = new HttpUtil();
    }
    return HttpUtil.mInstance;
  }

  request(url: string, option: RequestOptions): Promise<ApiResult> {
    return httpCore.request(url, option)
  }

  Post(url: string, option: RequestOptions) {
    if (option != null) {
      option.method = http.RequestMethod.POST
    }
    return this.request(url, option);
  }

  Get(url: string, option: RequestOptions) {
    if (option != null) {
      option.method = http.RequestMethod.GET
    }
    return this.request(url, option);
  }
}

export const httpUtil = HttpUtil.getInstance();