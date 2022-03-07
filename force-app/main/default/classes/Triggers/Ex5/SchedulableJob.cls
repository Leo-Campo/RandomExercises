public with sharing class SchedulableJob implements Schedulable{
  global void execute(SchedulableContext ctx){
    BatchProcessor bp = new BatchProcessor();
  }
}
