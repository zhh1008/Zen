import { Get, Param, Post } from '../common/http/Aop';
import { ApiResult } from '../common/http/ApiResult';

export class CommonApi {
  @Get("https://zipcloud.ibsnet.co.jp/api/search")
  getByZipCode(@Param("zipcode")zipCode: string): Promise<ApiResult> {
    return
  }
}
export const commonApi = new CommonApi();