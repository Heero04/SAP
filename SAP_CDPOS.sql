SELECT 
    OBJECTID AS sales_order_id,
    FNAME AS field_name,
    VALUE_OLD AS old_value,
    VALUE_NEW AS new_value,
    CHANGENR AS change_number,
    CHNGIND AS change_type,
    MANDANT AS client,
    OBJECTCLAS AS object_class,
    TABNAME AS table_name,
    TABKEY AS changed_table_record_key
FROM 
    cdpos
WHERE 
    (FNAME = 'KWMENG' OR  -- Sales Order Quantity in VBAP
     FNAME = 'EDATU' OR   -- Current Planned Delivery Date in VBEP
     FNAME = 'LFIMG' OR   -- Delivery Quantity in LIPS
     FNAME = 'LFDAT')     -- Delivery Received Date in LIKP
    AND MANDANT = 'Your_Client_ID'  -- Replace with your specific client ID if needed
    AND TABNAME IN ('VBAP', 'VBEP', 'LIPS', 'LIKP')  -- Replace with the SAP tables you're interested in
ORDER BY 
    sales_order_id, change_number;
