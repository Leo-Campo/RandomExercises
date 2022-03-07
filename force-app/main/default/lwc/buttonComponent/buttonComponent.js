import { LightningElement } from 'lwc';

export default class ButtonComponent extends LightningElement {
    clickedButtonLabel;

    handleClick() {
        this.clickedButtonLabel = 'Something Cool';
    }
}