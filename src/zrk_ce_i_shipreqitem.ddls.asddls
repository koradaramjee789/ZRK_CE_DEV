@EndUserText.label: 'Shipment Request Item'
@ObjectModel.query.implementedBy: 'ABAP:ZRK_CL_CE_SHIPMENT_REQ'
define custom entity ZRK_CE_I_ShipReqItem
  // with parameters parameter_name : parameter_type
{
  key ShipReqItemNo     : abap.numc( 3 );
      Description       : /dmo/description;
      PackageSize       : abap.char( 2 );
      PackageQuantity   : abap.numc( 2 );
      ShipmentStatus    : abap.char(15);
      DispatchDate      : abap.dats;
      DeliveryDate      : abap.dats;
      RecipientName     : abap.char( 40 );
      RecipientCompany  : abap.char( 40 );
      RecipientStreetNo : abap.char( 40 );
      RecipientCity     : abap.char( 20 );
      RecipientZipCode  : abap.numc( 5 );
      RecipientCountry  : abap.char( 20 );
}
