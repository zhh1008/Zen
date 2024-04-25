
import ArrayList from '@ohos.util.ArrayList';
import { ListItemDto } from './ListItemDto';
export class MasterDto {
  constructor(jsonData? : any) {
    if (jsonData != null) {
      Object.entries(jsonData['master']).forEach(([key, values]) => {
        switch (key) {
          case 'occupation':
            this.occupation = this.fromJSON(values)
            break;
          case 'kentaikyoTetyou':
            this.kentaikyoTetyou = this.fromJSON(values)
            break;
          case 'hasOrNot':
            this.hasOrNot = this.fromJSON(values)
            break;
          case 'foreman':
            this.foreman = this.fromJSON(values)
            break;
          case 'usageStatus':
            this.usageStatus = this.fromJSON(values)
            break;
          case 'periodStatus':
            this.periodStatus = this.fromJSON(values)
            break;
          case 'healthInsurance':
            this.healthInsurance = this.fromJSON(values)
            break;
          case 'fire_prevention_type':
            this.firePreventionType = this.fromJSON(values)
            break;
          case 'year_american':
            this.yearAmerican = this.fromJSON(values)
            break;
          case 'province':
            this.province = this.fromJSON(values)
            break;
          case 'driver_license':
            this.driverLicense = this.fromJSON(values)
            break;
          case 'day':
            this.day = this.fromJSON(values)
            break;
          case 'del_flag':
            this.delFlag = this.fromJSON(values)
            break;
          case 'stepladder_type':
            this.stepladderType = this.fromJSON(values)
            break;
          case 'yes_no':
            this.yesNo = this.fromJSON(values)
            break;
          case 'skill_training':
            this.skillTraining = this.fromJSON(values)
            break;
          case 'employment_contract':
            this.employmentContract = this.fromJSON(values)
            break;
          case 'constr_type':
            this.constrType = this.fromJSON(values)
            break;
          case 'sys_user_type':
            this.sysUserType = this.fromJSON(values)
            break;
          case 'have_insurance':
            this.haveInsurance = this.fromJSON(values)
            break;
          case 'month':
            this.month = this.fromJSON(values)
            break;
          case 'vehicle_use_purpose':
            this.vehicleUsePurpose = this.fromJSON(values)
            break;
          case 'elderly_age':
            this.elderlyAge = this.fromJSON(values)
            break;
          case 'contr_type':
            this.contrType = this.fromJSON(values)
            break;
          case 'system_default_productivity':
            this.systemDefaultProductivity = this.fromJSON(values)
            break;
          case 'tetubu_unit':
            this.tetubuUnit = this.fromJSON(values)
            break;
          case 'pension_insurance':
            this.pensionInsurance = this.fromJSON(values)
            break;
          case 'presence_or_absence':
            this.presenceOrAbsence = this.fromJSON(values)
            break;
          case 'occupation_engage':
            this.occupationEngage = this.fromJSON(values)
            break;
          case 'show_hide':
            this.showHide = this.fromJSON(values)
            break;
          case 'fire_prevention_usage_purpose':
            this.firePreventionUsagePurpose = this.fromJSON(values)
            break;
          case 'fire_prevention_management_method':
            this.firePreventionManagementMethod = this.fromJSON(values)
            break;
          case 'employment_insurance':
            this.employmentInsurance = this.fromJSON(values)
            break;
          case 'man_day_unit':
            this.manDayUnit = this.fromJSON(values)
            break;
          case 'worker_type':
            this.workerType = this.fromJSON(values)
            break;
          case 'blood_type':
            this.bloodType = this.fromJSON(values)
            break;
          case 'relationship':
            this.relationship = this.fromJSON(values)
            break;
          case 'license_type':
            this.licenseType = this.fromJSON(values)
            break;
          case 'sex':
            this.sex = this.fromJSON(values)
            break;
          case 'shooting_place':
            this.shootingPlace = this.fromJSON(values)
            break;
          case 'permitType':
            this.permitType = this.fromJSON(values)
            break;
          case 'structure':
            this.structure = this.fromJSON(values)
            break;
          case 'yearAmericanRecently':
            this.yearAmericanRecently = this.fromJSON(values)
            break;
          case 'specialMedicalExaminationType':
            this.specialMedicalExaminationType = this.fromJSON(values)
            break;
          case 'workerAttribute':
            this.workerAttribute = this.fromJSON(values)
            break;
          case 'tetubuSpec':
            this.tetubuSpec = this.fromJSON(values)
            break;
          case 'fullTime':
            this.fullTime = this.fromJSON(values)
            break;
          case 'machine':
            this.machine = this.fromJSON(values)
            break;
          case 'workloadProductiveUnit':
            this.workloadProductiveUnit = this.fromJSON(values)
            break;
          case 'adminAgency':
            this.adminAgency = this.fromJSON(values)
            break;
          case 'constructionQualification':
            this.constructionQualification = this.fromJSON(values)
            break;
          default:
            break;
        }
      })
    }
  }

  occupation: ArrayList<ListItemDto>;
  kentaikyoTetyou: ArrayList<ListItemDto>;
  hasOrNot: ArrayList<ListItemDto>;
  foreman: ArrayList<ListItemDto>;
  usageStatus: ArrayList<ListItemDto>;
  periodStatus: ArrayList<ListItemDto>;
  healthInsurance: ArrayList<ListItemDto>;
  firePreventionType: ArrayList<ListItemDto>;
  yearAmerican: ArrayList<ListItemDto>;
  province: ArrayList<ListItemDto>;
  driverLicense: ArrayList<ListItemDto>;
  day: ArrayList<ListItemDto>;
  delFlag: ArrayList<ListItemDto>;
  stepladderType: ArrayList<ListItemDto>;
  yesNo: ArrayList<ListItemDto>;
  skillTraining: ArrayList<ListItemDto>;
  employmentContract: ArrayList<ListItemDto>;
  constrType: ArrayList<ListItemDto>;
  sysUserType: ArrayList<ListItemDto>;
  haveInsurance: ArrayList<ListItemDto>;
  month: ArrayList<ListItemDto>;
  vehicleUsePurpose: ArrayList<ListItemDto>;
  elderlyAge: ArrayList<ListItemDto>;
  contrType: ArrayList<ListItemDto>;
  systemDefaultProductivity: ArrayList<ListItemDto>;
  tetubuUnit: ArrayList<ListItemDto>;
  pensionInsurance: ArrayList<ListItemDto>;
  presenceOrAbsence: ArrayList<ListItemDto>;
  occupationEngage: ArrayList<ListItemDto>;
  showHide: ArrayList<ListItemDto>;
  firePreventionUsagePurpose: ArrayList<ListItemDto>;
  firePreventionManagementMethod: ArrayList<ListItemDto>;
  employmentInsurance: ArrayList<ListItemDto>;
  manDayUnit: ArrayList<ListItemDto>;
  workerType: ArrayList<ListItemDto>;
  bloodType: ArrayList<ListItemDto>;
  relationship: ArrayList<ListItemDto>;
  licenseType: ArrayList<ListItemDto>;
  sex: ArrayList<ListItemDto>;
  shootingPlace: ArrayList<ListItemDto>;
  permitType: ArrayList<ListItemDto>;
  structure: ArrayList<ListItemDto>;
  yearAmericanRecently: ArrayList<ListItemDto>;
  specialMedicalExaminationType: ArrayList<ListItemDto>;
  workerAttribute: ArrayList<ListItemDto>;
  tetubuSpec: ArrayList<ListItemDto>;
  fullTime: ArrayList<ListItemDto>;
  machine: ArrayList<ListItemDto>;
  workloadProductiveUnit: ArrayList<ListItemDto>;
  adminAgency: ArrayList<ListItemDto>;
  constructionQualification: ArrayList<ListItemDto>;

  fromJSON(values: any): ArrayList<ListItemDto> {
    let itemValue : ArrayList<ListItemDto> = new ArrayList<ListItemDto>();
    (values as []).forEach(item => {
      let itemDto : ListItemDto = new ListItemDto()
      itemDto.abb = item['abb']
      itemDto.code = item['code']
      itemDto.name = item['name']
      itemValue.add(itemDto)
    });
    return itemValue;
  }
}
