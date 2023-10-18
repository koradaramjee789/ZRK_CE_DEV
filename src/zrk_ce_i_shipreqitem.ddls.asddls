@EndUserText.label: 'Shipment Request Item'
@ObjectModel.query.implementedBy: 'ABAP:ZRK_CL_CE_SHIPMENT_REQ'
@UI.headerInfo: {
    typeName: 'Shipment Request Item',
    typeNamePlural: 'Shipment Request items',
    title: {
        type: #STANDARD,
        value: 'ShipReqItemNo'
    },
    description: {
        type: #STANDARD,
        value: 'Description'
    }
}
define custom entity ZRK_CE_I_ShipReqItem
  // with parameters parameter_name : parameter_type
{
     @UI.facet      : [{
          id         : 'General',
          purpose    : #STANDARD,
          position   : 10,
          label      : 'General',
          type       :  #IDENTIFICATION_REFERENCE
      }]
      @UI.hidden        : true
  key ShipReqNo         : zrk_ship_req;
      @UI.lineItem      : [{ position: 10 }]
  key ShipReqItemNo     : abap.numc( 3 );
      @UI.lineItem      : [{ position: 20 }]
      @UI.identification      : [{ position: 10 }]
      Description       : /dmo/description;
      @UI.lineItem      : [{ position: 30 }]
      @UI.identification      : [{ position: 20 }]
      PackageSize       : abap.char( 2 );
      @UI.lineItem      : [{ position: 40 }]
      @UI.identification      : [{ position: 30 }]
      PackageQuantity   : abap.numc( 2 );
      @UI.lineItem      : [{ position: 50 }]
      @UI.identification      : [{ position: 40 }]
      ShipmentStatus    : abap.char(15);
      @UI.lineItem      : [{ position: 60 }]
      @UI.identification      : [{ position: 50 }]
      DispatchDate      : abap.dats;
      @UI.lineItem      : [{ position: 70 }]
      @UI.identification      : [{ position: 60 }]
      DeliveryDate      : abap.dats;
      @UI.lineItem      : [{ position: 80 }]
      @UI.identification      : [{ position: 70 }]
      RecipientName     : abap.char( 40 );
      @UI.identification      : [{ position: 80 }]
      RecipientCompany  : abap.char( 40 );
      @UI.identification      : [{ position: 90 }]
      RecipientStreetNo : abap.char( 40 );
      @UI.identification      : [{ position: 100 }]
      RecipientCity     : abap.char( 20 );
      @UI.identification      : [{ position: 110 }]
      RecipientZipCode  : abap.numc( 5 );
      @UI.identification      : [{ position: 120 }]
      RecipientCountry  : abap.char( 20 );
      
      _ShipReq : association to parent ZRK_CE_I_ShipReq 
        on $projection.ShipReqNo = _ShipReq.ShipReqNo ;
}
