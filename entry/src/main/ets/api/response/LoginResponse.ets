
import { Response } from './Response'

class TokenData {
  tokenHead : string
  token : string
  isManager : number
  firstLogin : number
  changePwd : boolean
}

export class LoginResponse extends Response {
  data : TokenData
}