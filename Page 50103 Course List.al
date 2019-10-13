page 50103 "Course List"
{
    PageType = List;
    SourceTable = Course;
    CardPageId = "Course Card";
    Editable = false;
    Caption = 'Course List';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;

                }
                field(Name; Name)
                {
                    ApplicationArea = All;

                }
                field(Description; Description)
                {
                    ApplicationArea = All;

                }
                field(Level; Level)
                {
                    ApplicationArea = All;

                }
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;

                }
                field(SPA; SPA)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
            }
            action("Insert Table")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Caption = 'Insert Table';

                trigger onAction();
                begin
                    InsertNewRecord();
                end;
            }
        }
    }

    var
        Level: text[30];
        Suggestion: text[80];
        SPA: Boolean;

    procedure InsertNewRecord();
    var
        courseRec: Record Course;
    begin
        with courseRec do begin
            Init;
            Code := '80040';
            Name := 'Installation & Configuration';
            Description := 'Basic knowledge of Installation & Configuration';
            Type := Type::"Remote Training";
            Duration := 2.0;
            Price := 1000.0;
            Active := true;
            Difficulty := 5;
            PassingRate := 75;
            Insert;
            Message('Already Insert');
        end;
    end;

    trigger OnAfterGetRecord();
    begin
        Level := '';
        Suggestion := '';
        SPA := false;
        case Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginner';
                    Suggestion := 'Take e-eLarning or remote training';
                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend instructor-Led';
                end;
            9 .. 10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Attend instructor-Led and self sdudy';
                end;
        end;
        if (passingRate >= 70) AND (Difficulty >= 6) then
            SPA := true;
    end;
}