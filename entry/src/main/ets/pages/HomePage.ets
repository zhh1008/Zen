
import { homeApi } from '../api/HomeApi';
import preferenceUtil from '../common/utils/PreferencesUtil';
import { MasterDto } from '../model/MasterDto';
import { LoginPage } from './LoginPage';
import { MinePage } from './MinePage';

let storage: LocalStorage = LocalStorage.GetShared()

@Entry(storage)
@Component
struct HomePage {
  @State isLogged: boolean = false;
  @LocalStorageLink("dict") dict: MasterDto = new MasterDto();

  async aboutToAppear() {
    this.isLogged = (await preferenceUtil.get("isLogged", false)) as boolean;
    let masterData = (await homeApi.master()).data;
    this.dict = new MasterDto(masterData);
  }

  build() {
    if (this.isLogged) {
      MinePage({isLogged: $isLogged})
    } else {
      LoginPage({isLogged: $isLogged})
    }
  }
}
