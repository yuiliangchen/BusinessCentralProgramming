codeunit 50141 "Expense Subscribers"
{
    // VERSION WHO   DATE
    // BC1.00  ychen 2019/11/12


    trigger OnRun()
    begin
    end;

    var
        TextDisableExp: Label 'Expense Code %1 error in Purchase Line No.%2';
        Expense: Record "Expense";

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterAssignGLAccountValues', '', false, false)]
    local procedure TransferExpenseCodeToPurchLineFromGL(var PurchLine: Record "Purchase Line"; 
        GLAccount: Record "G/L Account")
    begin
        WITH PurchLine DO BEGIN
            "Expense Code" := GLAccount."Expense Code";
        END;
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure OnAfterValidatePOQuantity(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line"; 
        CurrFieldNo: Integer)
    begin
        IF (xRec.Quantity <> 0) AND (Rec.Quantity <> xRec.Quantity) THEN
            Rec.VALIDATE("Expense Code", '');
    end;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnBeforePostLines', '', false, false)]
    local procedure OnBeforePurchaseOrderPostLines(var PurchLine: Record "Purchase Line"; 
        PurchHeader: Record "Purchase Header"; PreviewMode: Boolean; CommitIsSupressed: Boolean)
    begin
        OnBeforePurchaseOrderPostLines_CheckExpenseCode(PurchLine, PurchHeader, PreviewMode, CommitIsSupressed);
    end;

    local procedure OnBeforePurchaseOrderPostLines_CheckExpenseCode(var PurchLine: Record "Purchase Line"; 
        var PurchHeader: Record "Purchase Header"; PreviewMode: Boolean; CommitIsSupressed: Boolean)
    begin
        IF PurchLine.FINDFIRST THEN
            REPEAT
                IF PurchLine.Type = PurchLine.Type::"G/L Account" THEN BEGIN
                    PurchLine.TESTFIELD("Expense Code");
                    Expense.GET(PurchLine."Expense Code");
                    IF Expense.Disabled THEN
                        ERROR(STRSUBSTNO(TextDisableExp, Expense.Code, PurchLine."Line No."));
                END;
            UNTIL (PurchLine.NEXT = 0);
    end;

    [EventSubscriber(ObjectType::Table, 49, 'OnAfterInvPostBufferPreparePurchase', '', false, false)]
    local procedure ExpenseCodeOnAfterCopyGenJnlLineFromInvPostBuffer(var PurchaseLine: Record "Purchase Line";
        var InvoicePostBuffer: Record "Invoice Post. Buffer")
    begin
        InvoicePostBuffer."Expense Code" := PurchaseLine."Expense Code";
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterCopyGenJnlLineFromInvPostBuffer', '', false, false)]
    local procedure ExpenseCodeOnAfterInvPostBufferPreparePurchase(InvoicePostBuffer: Record "Invoice Post. Buffer"; 
        var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Expense Code" := InvoicePostBuffer."Expense Code";
    end;

    [EventSubscriber(ObjectType::Table, 17, 'OnAfterCopyGLEntryFromGenJnlLine', '', false, false)]
    local procedure ExpenseCodeAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; 
        var GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry."Expense Code" := GenJournalLine."Expense Code";
    end;
}