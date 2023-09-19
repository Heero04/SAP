SELECT 
    VBAP.VBELN AS sales_order_id,
    VBAP.KWMENG AS sales_order_quantity,
    VBEP.EDATU AS planned_delivery_date,
    LIPS.LFIMG AS delivery_quantity,
    LIKP.LFDAT AS delivery_received_date
FROM 
    VBAP
JOIN VBEP ON VBAP.VBELN = VBEP.VBELN AND VBAP.POSNR = VBEP.POSNR
JOIN LIPS ON VBAP.VBELN = LIPS.VGBEL AND VBAP.POSNR = LIPS.VGPOS
JOIN LIKP ON LIPS.VBELN = LIKP.VBELN
ORDER BY 
    VBAP.VBELN;


SELECT 
    cdpos.OBJECTID AS sales_order_id,
    VBAP.KWMENG AS sales_order_quantity,
    VBEP.EDATU AS planned_delivery_date,
    LIPS.LFIMG AS delivery_quantity,
    LIKP.LFDAT AS delivery_received_date,
    cdpos.FNAME AS field_name,
    cdpos.VALUE_OLD AS old_value,
    cdpos.VALUE_NEW AS new_value,
    cdpos.CHANGENR AS change_number,
    cdpos.CHNGIND AS change_type
FROM 
    cdpos
JOIN VBAP ON cdpos.OBJECTID = VBAP.VBELN
JOIN VBEP ON VBAP.VBELN = VBEP.VBELN AND VBAP.POSNR = VBEP.POSNR
JOIN LIPS ON VBAP.VBELN = LIPS.VGBEL AND VBAP.POSNR = LIPS.VGPOS
JOIN LIKP ON LIPS.VBELN = LIKP.VBELN
WHERE 
    (cdpos.FNAME = 'KWMENG' OR  -- Sales Order Quantity
     cdpos.FNAME = 'EDATU' OR   -- Planned Delivery Date
     cdpos.FNAME = 'LFIMG' OR   -- Delivery Quantity
     cdpos.FNAME = 'LFDAT')     -- Delivery Received Date
ORDER BY 
    cdpos.OBJECTID, cdpos.CHANGENR;
