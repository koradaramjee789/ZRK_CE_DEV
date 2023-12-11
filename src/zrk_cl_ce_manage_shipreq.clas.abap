CLASS zrk_cl_ce_manage_shipreq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
*    TYPES : tt_shipreq_resp TYPE TABLE OF ZRK_CE_I_ShipReq .
    TYPES tt_shipreq_resp     TYPE TABLE OF ZRK_CE_I_ShipReq.
    TYPES tt_shipreqitem_resp TYPE TABLE OF ZRK_CE_I_ShipReqItem.

    CLASS-METHODS get_instance RETURNING VALUE(rv_instance) TYPE REF TO zrk_cl_ce_manage_shipreq.

    METHODS get_shipment_requests
      IMPORTING io_request      TYPE REF TO if_rap_query_request OPTIONAL
      EXPORTING et_shipreq_resp TYPE tt_shipreq_resp
      RAISING   zrk_cx_ce_rap_query_provider.

    METHODS get_shipment_req_det
      IMPORTING im_shipreq_no   TYPE zrk_ship_req
      EXPORTING es_shipreq_resp TYPE ZRK_CE_I_ShipReq.

    METHODS get_shipment_request_items
      IMPORTING io_request          TYPE REF TO if_rap_query_request OPTIONAL
      EXPORTING et_shipreqitem_resp TYPE tt_shipreqitem_resp.

  PRIVATE SECTION.
    CLASS-DATA go_instance     TYPE REF TO zrk_cl_ce_manage_shipreq.
    CLASS-DATA gt_shipreq_resp TYPE TABLE OF ZRK_CE_I_ShipReq.
ENDCLASS.


CLASS zrk_cl_ce_manage_shipreq IMPLEMENTATION.
  METHOD get_instance.
    IF go_instance IS NOT BOUND.
      go_instance = NEW #( ).
    ENDIF.
    rv_instance = go_instance.
  ENDMETHOD.

  METHOD get_shipment_requests.
    IF io_request IS BOUND.
      " paging
      " TODO: variable is assigned but never used (ABAP cleaner)
      DATA(lt_filter) = io_request->get_filter( )->get_as_ranges(  ).
      " TODO: variable is assigned but never used (ABAP cleaner)
      DATA(lv_offset) = io_request->get_paging( )->get_offset( ).
      DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).
      " TODO: variable is assigned but never used (ABAP cleaner)
      DATA(lv_max_rows) = COND #( WHEN lv_page_size = if_rap_query_paging=>page_size_unlimited
                                  THEN 0
                                  ELSE lv_page_size ).
      " sorting
      " TODO: variable is assigned but never used (ABAP cleaner)
      DATA(sort_elements) = io_request->get_sort_elements( ).
    ENDIF.
    APPEND INITIAL LINE TO et_shipreq_resp ASSIGNING FIELD-SYMBOL(<fs_ship_req>).
    <fs_ship_req>-ShipReqNo      = 'SH0001'.
    <fs_ship_req>-Description    = 'Sample Request'.
    <fs_ship_req>-SubmissionDate = '20231010'.
    <fs_ship_req>-SenderName     = 'Lorenz Egon'.
    <fs_ship_req>-SenderCity     = 'Stuttgart'.
    <fs_ship_req>-SenderStreetNo = 'Kelvin Straße 5'.
    <fs_ship_req>-SenderZipCode  = '50041'.
    <fs_ship_req>-SenderCountry  = 'Germany'.

    IF VALUE #( lt_filter[ name = 'SHIPREQNO' ]-range[ 1 ]-low OPTIONAL ) <> 'SH0001' .

      RAISE EXCEPTION TYPE zrk_cx_ce_rap_query_provider
        EXPORTING
          textid = VALUE scx_t100key( msgid = 'ZRK_MESSAGES'
          msgno = 010 ).


    ENDIF.
  ENDMETHOD.

  METHOD get_shipment_req_det.
    IF gt_shipreq_resp IS INITIAL.
      get_shipment_requests( IMPORTING et_shipreq_resp = gt_shipreq_resp ).
    ENDIF.
  ENDMETHOD.

  METHOD get_shipment_request_items.
    IF io_request IS BOUND.
      " paging
      " TODO: variable is assigned but never used (ABAP cleaner)
      DATA(lt_filter) = io_request->get_filter( ).
      " TODO: variable is assigned but never used (ABAP cleaner)
      DATA(lv_offset) = io_request->get_paging( )->get_offset( ).
      DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).
      " TODO: variable is assigned but never used (ABAP cleaner)
      DATA(lv_max_rows) = COND #( WHEN lv_page_size = if_rap_query_paging=>page_size_unlimited
                                  THEN 0
                                  ELSE lv_page_size ).
      " sorting
      " TODO: variable is assigned but never used (ABAP cleaner)
      DATA(sort_elements) = io_request->get_sort_elements( ).
    ENDIF.
    APPEND INITIAL LINE TO et_shipreqitem_resp ASSIGNING FIELD-SYMBOL(<fs_ship_req>).
    <fs_ship_req>-ShipReqNo       = 'SH0001'.
    <fs_ship_req>-ShipReqItemNo   = '10'.
    <fs_ship_req>-Description     = 'Sample Request item'.
    <fs_ship_req>-PackageSize     = 'XL'.
    <fs_ship_req>-PackageQuantity = '2'.
    <fs_ship_req>-ShipmentStatus  = 'In progress'.
    <fs_ship_req>-DispatchDate    = '20231011'.
    <fs_ship_req>-DeliveryDate    = '20231020'.
    <fs_ship_req>-RecipientName   = 'Bogdan Nelsan'.
    <fs_ship_req>-CreateHidden = abap_true.
    <fs_ship_req>-DeleteHidden = abap_true.
  ENDMETHOD.
ENDCLASS.
