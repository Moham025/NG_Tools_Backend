Attribute VB_Name = "Forme"
Sub ConvertirEnTableau()
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long

    ' D�finir la feuille "resultat"
    Set ws = ThisWorkbook.Sheets("resultat")

    ' Trouver la derni�re ligne et la derni�re colonne utilis�es
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column

    ' Convertir les valeurs en tableau
    ws.ListObjects.Add(xlSrcRange, ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol)), , xlYes).Name = "TableauResultat"

    'MsgBox "Les valeurs de la feuille 'resultat' ont �t� converties en tableau.", vbInformation
    Millier
    SommeEtFormat
End Sub

Sub Millier()
    With Range("TableauResultat")
        .Style = "Comma"
        .NumberFormat = "_-* #,##0_-;-* #,##0_-;_-* ""-""??_-;_-@_-"
    End With
End Sub

Sub SommeEtFormat()
    ' D�sactiver les ajustements automatiques du tableau
    Application.AutoCorrect.AutoFillFormulasInLists = False
    
    ' �crire "Prix total du fer" dans la cellule G1
    Range("G1").Value = "Prix total du fer"
    
    ' Faire la somme des cellules B7 � F7 et mettre le r�sultat dans G7
    Range("G7").Value = Application.WorksheetFunction.Sum(Range("B7:F7"))
    
    ' Formater la cellule G7
    With Range("G7")
        .Font.Bold = True
        .Font.Color = RGB(255, 255, 255) ' Texte en blanc
        .Interior.Color = RGB(255, 0, 0) ' Fond en rouge
        .Font.Size = 14 ' Taille du texte � 14
    End With
    ' D�finir la largeur de la colonne G � 18
    Columns("G").ColumnWidth = 18
    Columns("A").ColumnWidth = 18
    Range("A2:A7").Font.Bold = True
    ' R�activer les ajustements automatiques du tableau (si n�cessaire)
    'Application.AutoCorrect.AutoFillFormulasInLists = True
End Sub
