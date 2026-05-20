@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZBIGLIETTO_DC2'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_BIGLIETTO_DC2
  provider contract transactional_query
  as projection on ZI_BIGLIETTO_DC2
  association [1..1] to ZI_BIGLIETTO_DC2 as _BaseEntity on $projection.ID = _BaseEntity.ID
{
  key ID,
  @Semantics: {
    user.createdBy: true
  }
  CreatoDa,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreatoA,
  @Semantics: {
    user.lastChangedBy: true
  }
  ModifDa,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  ModifA,
  LocalModifA,
  _BaseEntity
}
