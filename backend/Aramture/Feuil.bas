Attribute VB_Name = "Feuil"

Sub SupprimerFeuilleResultat()
    Dim ws As Worksheet
    Dim feuilleExiste As Boolean
    Dim feuilleExiste2 As Boolean

    ' V�rifier si la feuille "resultat" existe
    feuilleExiste = False
    For Each ws In ThisWorkbook.Sheets
        If ws.Name = "resultat" Then
            feuilleExiste = True
            Exit For
        End If
    Next ws

    ' Supprimer la feuille "resultat" si elle existe
    If feuilleExiste Then
        Application.DisplayAlerts = False
        ThisWorkbook.Sheets("resultat").Delete
        Application.DisplayAlerts = True
        'MsgBox "La feuille 'resultat' a �t� supprim�e.", vbInformation
    Else
        'MsgBox "La feuille 'resultat' n'existe pas.", vbInformation
    End If
End Sub
Sub CreerEtActiverFeuilleInfo()
    Dim ws As Worksheet

    ' V�rifier si la feuille "info" existe d�j�
    On Error Resume Next
    Set ws = ThisWorkbook.Sheets("info")
    On Error GoTo 0

    ' Si la feuille "info" existe, la supprimer
    If Not ws Is Nothing Then
        Application.DisplayAlerts = False
        ws.Delete
        Application.DisplayAlerts = True
    End If

    ' Cr�er une nouvelle feuille appel�e "info"
    Set ws = ThisWorkbook.Sheets.Add
    ws.Name = "info"

    ' Activer la feuille "info"
    ws.Activate

    'MsgBox "La feuille 'info' a �t� cr��e et activ�e.", vbInformation
End Sub

