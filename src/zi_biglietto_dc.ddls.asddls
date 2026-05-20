@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Biglietti'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_biglietto_dc
  as select from zbiglietto_dc as biglietto

{
  key biglietto.id        as IdBiglietto,
      @Semantics: {
      user: {
              createdBy: true
          }
          }

      biglietto.creato_da as CreatoDa,
      @Semantics.systemDateTime.createdAt: true
      biglietto.creato_a  as CreatoA,
      // Commento
      @Semantics.user.lastChangedBy: true
      biglietto.modif_da  as ModifDa,
      @Semantics.systemDateTime.lastChangedAt: true
      biglietto.modif_a   as ModifA,
      cast ( 'X' as abap_boolean ) as Creato,
// AGGIUNTO CAMPO(MODIFICATO) CALCOLATO IN BASE AD ALTRI DUE CAMPI
      case when biglietto.modif_a <> biglietto.creato_a
      then 'X'
      else ''
      end                 as MODIFICATO
}
