@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Biglietti'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zc_biglietto_dc
  provider contract transactional_query
  as projection on zi_biglietto_dc as biglietto
{
  key biglietto.IdBiglietto,
      biglietto.CreatoDa,
      biglietto.CreatoA,
      biglietto.ModifDa,
      biglietto.ModifA,
      biglietto.Creato,
      biglietto.MODIFICATO

}
