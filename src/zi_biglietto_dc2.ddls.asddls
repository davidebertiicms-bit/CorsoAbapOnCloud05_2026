@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZBIGLIETTO_DC2'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZI_BIGLIETTO_DC2
  as select from zbiglietto_dc2
{
  key id as ID,
  @Semantics.user.createdBy: true
  creato_da as CreatoDa,
  @Semantics.systemDateTime.createdAt: true
  creato_a as CreatoA,
  @Semantics.user.lastChangedBy: true
  modif_da as ModifDa,
  @Semantics.systemDateTime.lastChangedAt: true
  modif_a as ModifA,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_modificato_a as LocalModifA,
  stato 

}
