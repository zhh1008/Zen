import { ObservedArray } from './CommonDto';
import { WorkTypeListItem } from './WorkTypeListItem';

@Observed
export class CompanyInfo {
  constructor(jsonData?: any) {
    if (jsonData != null) {
      this.companyId = jsonData['companyId'];
      this.companyName = jsonData['companyName'];
      this.licenseId = jsonData['licenseId'];
      this.contrId = jsonData['contrId'];
      this.contrType = jsonData['contrType'];
      this.presName = jsonData['presName'];
      this.companyAddr = jsonData['companyAddr'];
      this.companyTel = jsonData['companyTel'];
      this.presEmail = jsonData['presEmail'];
      this.workerType = jsonData['workerType'];
      this.siteVehicles = jsonData['siteVehicles'];
      this.stepladder = jsonData['stepladder'];
      this.dragInMachine = jsonData['dragInMachine'];
      this.dragInMachineCrane = jsonData['dragInMachineCrane'];
      this.healthInsYesNo = jsonData['healthInsYesNo'];
      this.healthInsSalesName = jsonData['healthInsSalesName'];
      this.healthInsName = jsonData['healthInsName'];
      this.healthInsSymbols = jsonData['healthInsSymbols'];
      this.employmentInsYesNo = jsonData['employmentInsYesNo'];
      this.employmentInsSalesName = jsonData['employmentInsSalesName'];
      this.employmentInsLaborNumber = jsonData['employmentInsLaborNumber'];
      this.nationalPensionInsYesNo = jsonData['nationalPensionInsYesNo'];
      this.nationalPensionInsSalesName = jsonData['nationalPensionInsSalesName'];
      this.nationalPensionInsSymbols = jsonData['nationalPensionInsSymbols'];
      this.nationalPensionInsOfficeNumber = jsonData['nationalPensionInsOfficeNumber'];
      this.basicConstrPermitList = jsonData['basicConstrPermitList'];
      this.imprintImgId = jsonData['imprintImgId'];
      this.companyWorkTypeList = this.getCompanyWorkTypeList(jsonData['companyWorkTypeList']);
    }
  }

  companyId: number;
  companyName: string;
  licenseId: string;
  contrId: string;
  contrType: string;
  presName: string;
  companyAddr: string;
  companyTel: string;
  presEmail: string;
  workerType: ObservedArray<WorkTypeListItem>;
  siteVehicles: ObservedArray<SiteVehicle>;
  stepladder: string;
  dragInMachine: string;
  dragInMachineCrane: string;
  healthInsYesNo: string;
  healthInsSalesName: string;
  healthInsName: string;
  healthInsSymbols: string;
  employmentInsYesNo: string;
  employmentInsSalesName: string;
  employmentInsLaborNumber: string;
  nationalPensionInsYesNo: string;
  nationalPensionInsSalesName: string;
  nationalPensionInsSymbols: string;
  nationalPensionInsOfficeNumber: string;
  basicConstrPermitList: string[];
  imprintImgId: string;
  companyWorkTypeList: ObservedArray<WorkTypeListItem>;

  getWorkerTypeNames() {
    let workerTypeNames = "";
    for (let i = 0; i < this.companyWorkTypeList.length; i++) {
      if (i == this.companyWorkTypeList.length - 1) {
        workerTypeNames += this.companyWorkTypeList[i].name;
      } else {
        workerTypeNames += this.companyWorkTypeList[i].name + ","
      }
    }
    return workerTypeNames;
  }

  getCompanyWorkTypeList(companyWorkTypeList: []): ObservedArray<WorkTypeListItem> {
    let workTypeList: ObservedArray<WorkTypeListItem> = [];
    for (let i = 0; i < companyWorkTypeList.length; i++) {
      let workTypeListItem: WorkTypeListItem = new WorkTypeListItem();
      workTypeListItem.abb = companyWorkTypeList[i]['abb'];
      workTypeListItem.code = companyWorkTypeList[i]['code'];
      workTypeListItem.name = companyWorkTypeList[i]['name'];

      workTypeList.push(workTypeListItem)
    }
    return workTypeList;
  }
}


@Observed
export class SiteVehicle {
  id: string;
  vehicleNumber4: string;
  routeFrom: string;
  routeTo: string;
  voluntaryInsuranceSecuritie2ImgId: string;
  vehicleNumber3: string;
  via1: string;
  liabilityInsuranceFrom: string;
  liabilityInsuranceTo: string;
  personalLiabilityInsuranceLimit: string;
  certificateImgId: string;
  vehicleNumber2: string;
  vehicleType: string;
  liabilitySecuritieNumber: string;
  via2: string;
  driverUserId: string;
  objectLiabilityInsuranceLimit: string;
  vehicleUsePurposeDispName: string;
  vehicleUsePurpose: string;
  voluntaryInsuranceSecuritie3ImgId: string;
  voluntaryInsuranceCompanyName: string;
  vehicleNumber1: string;
  safeDriveManagerName: string;
  ownerName: string;
  voluntaryInsuranceSecuritie1ImgId: string;
  vehicleRegistYear: string;
  vehicleRegistMonth: string;
  vehicleRegistDay: string;
  vehicleValidPeriod: string;
  voluntaryInsuranceFrom: string;
  voluntaryInsuranceTo: string;
  passengerAccidentInsuranceLimit: string;
  liabilitySecuritieImgId: string;
  voluntarySecuritieNumber: string;
  liabilityInsuranceCompanyName: string;
}

