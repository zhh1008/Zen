
import Logger from '../common/utils/Logger';
import preferenceUtil from '../common/utils/PreferencesUtil';
import { LoginPage } from './LoginPage';
import { MinePage } from './MinePage';

@Entry
@Component
struct HomePage {
  @State isLogged: boolean = false;

  async aboutToAppear() {
    this.isLogged = (await preferenceUtil.get("isLogged", false)) as boolean;
    Logger.info("HOME_PAGE", "this.isLogged:" + this.isLogged)
  }

  build() {
    if (this.isLogged) {
      MinePage({isLogged: $isLogged})
    } else {
      LoginPage({isLogged: $isLogged})
    }
  }
}
