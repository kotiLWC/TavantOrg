public class JSONRoundTripExample {
    
    public class InvoiceStatement{
        Long invoiceNumber;
        DateTime statementdate;
        Decimal totalPrice;
        public InvoiceStatement(Long invNum, DateTime stmtDate, Decimal price) {
            invoiceNumber = invNum; 
            statementdate = stmtDate;
            totalPrice = price;
        }
    }
    
    public static void SerializeRoundtrip() {
        DateTime dt = DateTime.now();
        system.debug('Date value===>'+dt);
        
        List<InvoiceStatement> invoiceList = new List<InvoiceStatement>();
        InvoiceStatement inv1 = new InvoiceStatement(12345,dt,1000);
        InvoiceStatement inv2 = new InvoiceStatement(45231,dt,500);
        invoiceList.add(inv1);
        invoiceList.add(inv2);
        
        system.debug('invoiceList===>'+invoiceList);
        
        // Serialize the list of InvoiceStatement objects.
        String JsonString = JSON.serialize(invoiceList);
        System.debug('JsonString===>'+JsonString);
        
        // Deserialize the list of invoices from the JSON string.
        List<InvoiceStatement> deserializedInvoices = (List<InvoiceStatement>)JSON.deserialize(JsonString, List<InvoiceStatement>.class);    
        for(InvoiceStatement ds : deserializedInvoices) {
          system.debug('deserializes JSON===>'+ds);  
        }
        
        
    }
    
}