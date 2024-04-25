
import { Post } from '../common/http/Aop';
import { ApiResult } from '../common/http/ApiResult';
export class CompanyApi {
  @Post("https://stg.rakuzen-plus.com/api/company/companyinfo")
  companyInfo(): Promise<ApiResult> {
    return
  }
}
export const companyApi = new CompanyApi();