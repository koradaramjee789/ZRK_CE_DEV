CLASS zrk_cl_ce_shipment_req DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.

  PRIVATE SECTION.


ENDCLASS.


CLASS zrk_cl_ce_shipment_req IMPLEMENTATION.
  METHOD if_rap_query_provider~select.
    CASE io_request->get_entity_id( ).

      WHEN 'ZRK_CE_I_SHIPREQ'.

        zrk_cl_ce_manage_shipreq=>get_instance( )->get_shipment_requests(
          EXPORTING io_request      = io_request
          IMPORTING et_shipreq_resp = DATA(lt_shipreq_resp) ).
        IF io_request->is_data_requested( ).
          io_response->set_data( lt_shipreq_resp ).
        ENDIF.
        IF io_request->is_total_numb_of_rec_requested( ).
          io_response->set_total_number_of_records( lines( lt_shipreq_resp ) ).
        ENDIF.



      WHEN 'ZRK_CE_I_SHIPREQITEM'.

        zrk_cl_ce_manage_shipreq=>get_instance( )->get_shipment_request_items(
          EXPORTING io_request      = io_request
          IMPORTING et_shipreqitem_resp = DATA(lt_shipreqitem_resp) ).
        IF io_request->is_data_requested( ).
          io_response->set_data( lt_shipreqitem_resp ).
        ENDIF.
        IF io_request->is_total_numb_of_rec_requested( ).
          io_response->set_total_number_of_records( lines( lt_shipreqitem_resp ) ).
        ENDIF.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.
