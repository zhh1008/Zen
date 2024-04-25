
import { Post } from '../common/http/Aop';
import { ApiResult } from '../common/http/ApiResult';
export class HomeApi {
  @Post("https://stg.rakuzen-plus.com/api/master")
  master(): Promise<ApiResult> {
    return
  }
}
export const homeApi = new HomeApi();