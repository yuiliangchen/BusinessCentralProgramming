table 50141 Expense
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;Code; Code[20])
        {
            DataClassification = ToBeClassified;
            
        }
        field(2;Description; Text[50])
        {
            DataClassification = ToBeClassified;
            
        }
        field(3;Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
            
        }
    }
    
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}