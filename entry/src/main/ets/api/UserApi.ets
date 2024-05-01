
import { Post } from '../common/http/Aop';
import { ApiResult } from '../common/http/ApiResult';
import { EmployeeRequest } from './request/EmployeeRequest';

export class UserApi {
  @Post("https://stg.rakuzen-plus.com/api/user/userlist")
  userList(): Promise<ApiResult> {
    return
  }

  @Post("https://stg.rakuzen-plus.com/api/user/userinfo")
  userInfo(employeeRequest: EmployeeRequest): Promise<ApiResult> {
    return
  }
}
export const userApi = new UserApi();