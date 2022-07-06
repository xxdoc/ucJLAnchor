Attribute VB_Name = "mdlAnchor"
Public Const ST_KEYDIGVAL = "0123456789."
Public CtrlParent As Object

Public Function GetControlIndex(objControl As Object) As String
    On Error GoTo ErrorFunction
    '---
    If objControl.Index >= 0 Then
        GetControlIndex = objControl.Index
    Else
        GoTo Fin
    End If
    Exit Function
    '---
ErrorFunction:
Fin:
    GetControlIndex = ""
End Function

Public Function GetControlScaleWidth(objControl As Object) As Long
    On Error GoTo FunctionError
    GetControlScaleWidth = objControl.ScaleWidth
    Exit Function
FunctionError:
    GetControlScaleWidth = objControl.Width
End Function

Public Function GetControlScaleHeight(objControl As Object) As Long
    On Error GoTo FunctionError
    GetControlScaleHeight = objControl.ScaleHeight
    Exit Function
FunctionError:
    GetControlScaleHeight = objControl.Height
End Function

Public Function GetControlHwnd(objControl As Object) As Long
    On Error GoTo FunctionError
    GetControlHwnd = objControl.hWnd
    Exit Function
FunctionError:
    GetControlHwnd = 0
End Function

Public Function GetControlsParent(objParent As Object) As Long
    On Error GoTo ErrorFunction
    Dim c As Long
    For i = 0 To objParent.Controls.Count - 1
        If Len(objParent.Controls(i).Name) > 0 Then
            If objParent.Controls(i).Name <> "ucJLAnchor" Then
                c = c + 1
            End If
        End If
    Next
    GetControlsParent = c - 1
    Exit Function
ErrorFunction:
    GetControlsParent = c - 1
End Function

Public Function GetControlsCount(objControl As Object) As Integer
    On Error GoTo ErrorFunction
    GetControlsCount = objControl.Controls.Count
ErrorFunction:
    GetControlsCount = 0
End Function

Public Function ValidarKey(txtObject As TextBox, ValKey As Integer) As Integer
    Dim carKey As String
    '--
    ValidarKey = ValKey
    carKey = Chr(ValKey)
    '--
    If InStr(ST_KEYDIGVAL, carKey) = 0 Then
        ValidarKey = 0
    End If
End Function

Public Sub SafeRange(Value, Min, Max)
    If Value < Min Then Value = Min
    If Value > Max Then Value = Max
End Sub

Public Function GetMinWidthControl(ByVal objControl As Object) As Long
    Dim lTemp As Long
    '--
    lTemp = objControl.Width
    objControl.Width = 0
    GetMinWidthControl = objControl.Width
    objControl.Width = lTemp
    '--
End Function

Public Function GetMinHeightControl(ByVal objControl As Object) As Long
    Dim lTemp As Long
    '--
    lTemp = objControl.Height
    objControl.Height = 0
    GetMinHeightControl = objControl.Height
    objControl.Height = lTemp
    '--
End Function

Public Function BytesLength(abBytes() As Byte) As Long
    On Error Resume Next
    BytesLength = UBound(abBytes) - LBound(abBytes) + 1
End Function

Public Sub DrawBackAreaIcon(obj As Object)
    Dim i As Long, j As Long, x As Long
    '--
    For j = -1 To obj.ScaleHeight Step 5
        x = IIf(x = -1, 4, -1)
        For i = x To obj.ScaleWidth Step 10
            obj.Line (i, j)-(i + 4, j + 4), &HF2F2F2, BF
        Next
    Next
    '--
    obj.Line (0, 0)-(obj.ScaleWidth - 1, obj.ScaleHeight - 1), vbButtonShadow, B
    obj = obj.Image
End Sub

