
import { Param, Post } from '../common/http/Aop';
import { ApiResult } from '../common/http/ApiResult';

export class LoginApi {
  @Post("https://stg.rakuzen-plus.com/api/login")
  login(@Param("username") username: string, @Param("password") password: string): Promise<ApiResult> {
    return
  }
}
export const loginApi = new LoginApi();