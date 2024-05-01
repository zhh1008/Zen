
import StringUtils from '../common/utils/StringUtils';
@Observed
export class UserDto {
  constructor(jsonData?: any) {
    if (jsonData != null) {
      this.userId = jsonData['userId'];
      this.username = jsonData['username'];
      this.name = jsonData['name'];
      this.password = jsonData['password'];
      this.reading = jsonData['reading'];
      this.companyId = jsonData['companyId'];
      this.companyName = jsonData['companyName'];
      this.contrFlg = jsonData['contrFlg'];
      this.email = jsonData['email'];
      this.mobile = jsonData['mobile'];
      this.status = jsonData['status'];
      this.userIdCreate = jsonData['userIdCreate'];
      this.sex = StringUtils.convertSexByCode(jsonData['sex']);
      this.birth = jsonData['birth'];
      this.liveAddress = jsonData['liveAddress'];
      this.province = jsonData['province'];
      this.city = jsonData['city'];
      this.district = jsonData['district'];
      this.postCode = jsonData['postCode'];
      this.leadEngineer = jsonData['leadEngineer'];
      this.managementInstructor = jsonData['managementInstructor'];
      this.registStatus = jsonData['registStatus'];
      this.driverLicenseType = jsonData['driverLicenseType'];
      this.driverLicenseNo = jsonData['driverLicenseNo'];
      this.rakuzenId = jsonData['rakuzenId'];
      this.loginCount = jsonData['loginCount'];
      this.roleId = jsonData['roleId'];
    }
  }
  userId: string;
  username: string;
  name: string;
  password: string;
  reading: string;
  companyId: string;
  companyName: string;
  contrFlg: string;
  email: string;
  mobile: string;
  status: number;
  userIdCreate: string;
  sex: string;
  birth: string;
  liveAddress: string;
  province: string;
  city: string;
  district: string;
  postCode: string;
  leadEngineer: string;
  managementInstructor: string;
  registStatus: string;
  driverLicenseType: string;
  driverLicenseNo: string;
  rakuzenId: string;
  loginCount: string;
  roleId: string;

}
