
import { WorkTypeListItem } from '../model/WorkTypeListItem';
@Component
export struct WorkTypeModel {
  @ObjectLink item: WorkTypeListItem;

  changeSelect:() => void;

  build() {
    Row() {
      Text(this.item?.name).fontSize(20)
      Blank()
        .layoutWeight(1)
      Toggle({ type: ToggleType.Checkbox, isOn: this.item.isSelected })
        .size({ width: 20, height: 20 })
        .selectedColor('#007DFF')
        .onChange((isOn: boolean) => {
          this.item.isSelected = isOn
          this.changeSelect();
        })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: 12, right: 12 })
  }
}
