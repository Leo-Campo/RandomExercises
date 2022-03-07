import { LightningElement } from 'lwc';

export default class LifeCycleComponent extends LightningElement {
    constructor(){
        super();
        console.log('Siamo nel costruttore');
    }

    connectedCallback(){
        console.log('Connected Callback reached');
    }

    
}