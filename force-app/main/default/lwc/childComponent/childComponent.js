import { LightningElement, api, track } from 'lwc';

export default class ChildComponent extends LightningElement {

    @api titleVariable = 'First Title';

    @api
    show = false;

    @api
    changeTitle(){
        this.show = true;
    }
    /*
    constructor(){
        super();
        console.log(this.titleVariable);
    }
    */

    /*
    connectedCallback(){
        this.titleVariable = 'Second Title';
        console.log('title changed');
    }
    */
}