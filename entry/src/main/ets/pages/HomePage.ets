import { LoginComponent } from '../view/LoginComponent';
import { MinePage } from './MinePage';

@Entry
@Component
struct HomePage {
  @State isLogged: boolean = false;

  build() {
    if (this.isLogged) {
      MinePage({isLogged: $isLogged})
    } else {
      // LoginPage({isLogged: $isLogged})
      LoginComponent({isLogged: $isLogged})
    }
  }
}