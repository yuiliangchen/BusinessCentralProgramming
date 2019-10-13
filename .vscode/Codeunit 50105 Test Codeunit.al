codeunit 50105 "Test Codeunit"
{
    trigger OnRun()
    begin
        MESSAGE('The value of %1 is %2', 'LoopNo', LoopNo);
        MESSAGE('The value of %1 is %2', 'YesOrNo', YesOrNo);
        MESSAGE('The value of %1 is %2', 'Amount', Amount);
        MESSAGE('The value of %1 is %2', 'When Was It', "When Was It");
        MESSAGE('The value of %1 is %2', 'What Time', "What Time");
        MESSAGE('The value of %1 is %2', 'Description', Description);
        MESSAGE('The value of %1 is %2', 'Code Number', "Code Number");
        MESSAGE('The value of %1 is %2', 'Ch', Ch);
        MESSAGE('The value of %1 is %2', 'Color', Color);    
    end;
    
    var
        LoopNo: Integer;
        YesOrNo: Boolean;
        Amount: Decimal;
        "When Was It": Date;
        "What Time": Time;
        Description: Text[30];
        "Code Number": Code[10];
        Ch: Char;
        Color: Option Red, Orange, Yellow, Green, Blue, Violet;
}