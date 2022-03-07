import { LightningElement } from 'lwc';

export default class TextComponent extends LightningElement {
    repeatedText;

    handleEdit(event){
        this.repeatedText = event.target.value;
    }
}