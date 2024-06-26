import StringUtils from '../common/utils/StringUtils';
@Observed
export class EmployeeInfoDto {
  constructor(jsonData?: any) {
    if (jsonData != null) {
      this.id = jsonData['id'];
      this.userId = jsonData['userId'];
      this.phone = jsonData['phone'];
      this.homeTel = jsonData['homeTel'];
      this.emergencyContactName = jsonData['emergencyContactName'];
      this.emergencyContactRead = jsonData['emergencyContactRead'];
      this.emergencyContactRelationship = jsonData['emergencyContactRelationship'];
      this.emergencyContactAddress = jsonData['emergencyContactAddress'];
      this.emergencyContactTel = jsonData['emergencyContactTel'];
      this.employmentContract = jsonData['employmentContract'];
      this.hireDate = jsonData['hireDate'];
      this.experienceStartDate = jsonData['experienceStartDate'];
      this.workerAttribute = jsonData['workerAttribute'] as [];
      this.bloodType = jsonData['bloodType'];
      this.healthCheckupDate = jsonData['healthCheckupDate'];
      this.highPressure = jsonData['highPressure'];
      this.lowPressure = jsonData['lowPressure'];
      this.specialMedicalExaminationDate = jsonData['specialMedicalExaminationDate'];
      this.specialMedicalExaminationImgId = jsonData['specialMedicalExaminationImgId'];
      this.specialMedicalExaminationType = jsonData['specialMedicalExaminationType'];
      this.healthInsurance = jsonData['healthInsurance'];
      this.healthInsuranceNumber = jsonData['healthInsuranceNumber'];
      this.pensionInsurance = jsonData['pensionInsurance'];
      this.pensionInsuranceNumber = jsonData['pensionInsuranceNumber'];
      this.employmentInsurance = jsonData['employmentInsurance'];
      this.employmentInsuranceNumber = jsonData['employmentInsuranceNumber'];
      this.periodStatus = jsonData['periodStatus'];
      this.country = jsonData['country'];
      this.periodStart = jsonData['periodStart'];
      this.periodEnd = jsonData['periodEnd'];
      this.specificSkillImgId = jsonData['specificSkillImgId'];
      this.employmentConditionsImgId = jsonData['employmentConditionsImgId'];
      this.properManagementPlanImgId = jsonData['properManagementPlanImgId'];
      this.constCareerCardFrontImgId = jsonData['constCareerCardFrontImgId'];
      this.constCareerCardReverseImgId = jsonData['constCareerCardReverseImgId'];
      this.passportImgId = jsonData['passportImgId'];
      this.periodCardFrontImgId = jsonData['periodCardFrontImgId'];
      this.periodCardReverseImgId = jsonData['periodCardReverseImgId'];
      this.healthCheckupImgId = jsonData['healthCheckupImgId'];
      this.healthCheckupImgFlg = jsonData['healthCheckupImgFlg'];
      this.specialMedicalExaminationImgFlg = jsonData['specialMedicalExaminationImgFlg'];
      this.specificSkillImgFlg = jsonData['specificSkillImgFlg'];
      this.employmentConditionsImgFlg = jsonData['employmentConditionsImgFlg'];
      this.properManagementPlanImgFlg = jsonData['properManagementPlanImgFlg'];
      this.constCareerCardFrontImgFlg = jsonData['constCareerCardFrontImgFlg'];
      this.constCareerCardReverseImgFlg = jsonData['constCareerCardReverseImgFlg'];
      this.passportImgFlg = jsonData['passportImgFlg'];
      this.periodCardFrontImgFlg = jsonData['periodCardFrontImgFlg'];
      this.periodCardReverseImgFlg = jsonData['periodCardReverseImgFlg'];
      this.occupation = jsonData['occupation'] as [];
      this.foreman = jsonData['foreman'] as [];
      this.skillTraining = jsonData['skillTraining'] as [];
      this.occupationEngage = jsonData['occupationEngage'] as [];
      this.license = jsonData['license'];
      this.kentaikyoTetyou = jsonData['kentaikyoTetyou'];
    }
  }

  id: number;
  userId: string;
  phone: string;
  homeTel: string;
  emergencyContactName: string;
  emergencyContactRead: string;
  emergencyContactRelationship: string;
  emergencyContactAddress: string;
  emergencyContactTel: string;
  employmentContract: string;
  hireDate: string;
  experienceStartDate: string;
  workerAttribute: Array<string>;
  bloodType: string;
  healthCheckupDate: string;
  highPressure: string;
  lowPressure: string;
  specialMedicalExaminationDate: string;
  specialMedicalExaminationImgId: string;
  specialMedicalExaminationType: string;
  healthInsurance: string;
  healthInsuranceNumber: string;
  pensionInsurance: string;
  pensionInsuranceNumber: string;
  employmentInsurance: string;
  employmentInsuranceNumber: string;
  periodStatus: string;
  country: string;
  periodStart: string;
  periodEnd: string;
  specificSkillImgId: string;
  employmentConditionsImgId: string;
  properManagementPlanImgId: string;
  constCareerCardFrontImgId: string;
  constCareerCardReverseImgId: string;
  passportImgId: string;
  periodCardFrontImgId: string;
  periodCardReverseImgId: string;
  healthCheckupImgId: string;
  healthCheckupImgFlg: string;
  specialMedicalExaminationImgFlg: string;
  specificSkillImgFlg: string;
  employmentConditionsImgFlg: string;
  properManagementPlanImgFlg: string;
  constCareerCardFrontImgFlg: string;
  constCareerCardReverseImgFlg: string;
  passportImgFlg: string;
  periodCardFrontImgFlg: string;
  periodCardReverseImgFlg: string;
  occupation: Array<any>;
  foreman: Array<any>;
  skillTraining: Array<any>;
  occupationEngage: Array<any>;
  license: Array<any>;
  kentaikyoTetyou: string;

  getOccupationNames() {
    let result = []
    if (this.occupation == null) {
      return "";
    }
    this.occupation.forEach((element) => {
      result.push(element['value'])
    })
    return result.join(",")
  }

  getForemanNames() {
    let result = []
    if (this.foreman == null) {
      return "";
    }
    this.foreman.forEach((element) => {
      result.push(element['value'])
    })
    return result.join(",")
  }

  getSkillTrainingNames() {
    let result = []
    if (this.skillTraining == null) {
      return "";
    }
    this.skillTraining.forEach((element) => {
      result.push(element['value'])
    })
    return result.join(",")
  }

  getLicenseNames() {
    if (this.license == null) {
      return "";
    }
    return this.license['driverLicenseType']
  }
}