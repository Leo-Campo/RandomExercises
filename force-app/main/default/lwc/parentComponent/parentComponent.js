import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    parentTitle = "Parent's cool title";

    handleClick(event){
        this.parentTitle = "Button Title";
    }
}