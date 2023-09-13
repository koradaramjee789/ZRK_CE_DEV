CLASS zrk_cl_ce_shipment_req DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES : tt_shipreq_resp TYPE TABLE OF ZRK_CE_I_ShipReq .

ENDCLASS.



CLASS zrk_cl_ce_shipment_req IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    CASE io_request->get_entity_id( ).
      WHEN 'ZRK_CE_I_SHIPREQ'. "'ZRK_CE_I_ShipReq' .
        zrk_cl_ce_manage_shipreq=>get_instance( )->get_shipment_requests(
            EXPORTING io_request = io_request
            IMPORTING et_shipreq_resp = DATA(lt_shipreq_resp)
             ).
        IF io_request->is_data_requested( ).
          io_response->set_data( lt_shipreq_resp ).
        ENDIF.
        IF io_request->is_total_numb_of_rec_requested( ).
          io_response->set_total_number_of_records( lines( lt_shipreq_resp ) ).
        ENDIF.
    ENDCASE.

  ENDMETHOD.


ENDCLASS.
