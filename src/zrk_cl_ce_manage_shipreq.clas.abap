CLASS zrk_cl_ce_manage_shipreq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES : tt_shipreq_resp TYPE TABLE OF ZRK_CE_I_ShipReq .
    CLASS-METHODS: get_instance RETURNING VALUE(rv_instance) TYPE REF TO zrk_cl_ce_manage_shipreq.
    METHODS : get_shipment_requests
      IMPORTING io_request      TYPE REF TO if_rap_query_request OPTIONAL
      EXPORTING et_shipreq_resp TYPE tt_shipreq_resp,
      get_shipment_req_det
        IMPORTING im_shipreq_no   TYPE zrk_ship_req
        EXPORTING es_shipreq_resp TYPE ZRK_CE_I_ShipReq.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA : go_instance     TYPE REF TO zrk_cl_ce_manage_shipreq,
                 gt_shipreq_resp TYPE TABLE OF ZRK_CE_I_ShipReq.
ENDCLASS.



CLASS zrk_cl_ce_manage_shipreq IMPLEMENTATION.


  METHOD get_instance.
    IF go_instance IS NOT BOUND.
      go_instance = NEW #(  ).
    ENDIF.
    rv_instance = go_instance.
  ENDMETHOD.
  METHOD get_shipment_requests.

    IF io_request IS BOUND.
**paging
      DATA(lt_filter) = io_request->get_filter(  ).
      DATA(lv_offset) = io_request->get_paging( )->get_offset( ).
      DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).
      DATA(lv_max_rows) = COND #( WHEN lv_page_size = if_rap_query_paging=>page_size_unlimited
                                  THEN 0 ELSE lv_page_size ).
**sorting
      DATA(sort_elements) = io_request->get_sort_elements( ).
    ENDIF.
    APPEND INITIAL LINE TO et_shipreq_resp ASSIGNING FIELD-SYMBOL(<fs_ship_req>).
    <fs_ship_req>-ShipReqNo = 'SH0001'.
    <fs_ship_req>-Description = 'Sample Req'.
    <fs_ship_req>-SenderName = 'Ramjee'.
    <fs_ship_req>-SenderCity = 'Stuttgart'.
    <fs_ship_req>-SenderCountry = 'Germany'.

  ENDMETHOD.

  METHOD get_shipment_req_det.
    IF gt_shipreq_resp IS INITIAL.
      get_shipment_requests(
       IMPORTING
          et_shipreq_resp = gt_shipreq_resp
      ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
