
import { Param, Post } from '../common/http/Aop';
import { ApiResult } from '../common/http/ApiResult';

export class SiteApi {
  @Post("https://stg.rakuzen-plus.com/api/construction/site")
  site(): Promise<ApiResult> {
    return
  }
}
export const siteApi = new SiteApi();