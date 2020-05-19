' SpiralGen1

Sub Main

	Dim N As Integer
	Dim a As Double
	Dim x1 As Double
	Dim y1 As Double
	Dim x2 As Double
	Dim y2 As Double
	Dim offset As Double


	With Cylinder

    .Reset

    .Name ("Rx_patch")

    .Component ("Rx_antenna")

    .Material ("PEC")

    .Axis ("z")

    .Outerradius ("Rx_patch_r")

    .Innerradius (0)

    .Xcenter (0)

    .Ycenter (0)

    .Zcenter (0)

    .Zrange (0, "t_cu")

    .Segments (120)

    .Create
    End With

	With Cylinder

    .Reset

    .Name ("Tx_patch")

    .Component ("Tx_antenna")

    .Material ("PEC")

    .Axis ("z")

    .Outerradius ("Tx_patch_r")

    .Innerradius (0)

    .Xcenter (0)

    .Ycenter (0)

    .Zcenter (0)

    .Zrange (0, "t_cu")

    .Segments (120)

    .Create

	End With

	With Cylinder

    .Reset

    .Name ("rx_v")

    .Component ("Rx_feed")

    .Material ("PEC")

    .Axis ("z")

    .Outerradius ("feed_r")

    .Innerradius (0)

    .Xcenter (0)

    .Ycenter ("-rx_fpos")

    .Zcenter (0)

    .Zrange ("h", "t_cu")

    .Segments (0)

    .Create

	End With

	With Cylinder

    .Reset

    .Name ("rx_h")

    .Component ("Rx_feed")

    .Material ("PEC")

    .Axis ("z")

    .Outerradius ("feed_r")

    .Innerradius (0)

    .Xcenter ("rx_fpos")

    .Ycenter (0)

    .Zcenter (0)

    .Zrange ("h", "t_cu")

    .Segments (120)

    .Create

	End With

	With Cylinder

    .Reset

    .Name ("tx_v")

    .Component ("Tx_feed")

    .Material ("PEC")

    .Axis ("z")

    .Outerradius ("feed_r")

    .Innerradius (0)

    .Xcenter (0)

    .Ycenter ("-tx_fpos")

    .Zcenter (0)

    .Zrange ("h", "t_cu")

    .Segments (0)

    .Create

	End With

	With Cylinder

    .Reset

    .Name ("tx_h")

    .Component ("Tx_feed")

    .Material ("PEC")

    .Axis ("z")

    .Outerradius ("feed_r")

    .Innerradius (0)

    .Xcenter ("tx_fpos")

    .Ycenter (0)

    .Zcenter (0)

    .Zrange ("h", "t_cu")

    .Segments (120)

    .Create

	End With


	a = 1.13
	d = 10.00
	offset = 2.0


	For N = 1 To 256 STEP 1

		x1 = a*Sqr(2*d*N/a)*Cos(Sqr(2*d*N/a))
		y1 = a*Sqr(2*d*N/a)*Sin(Sqr(2*d*N/a))

		With Transform
			.Name "Rx_antenna:Rx_patch"
			.AddName "Rx_feed:rx_v"
			.AddName "Rx_feed:rx_h"
			.Vector (x1, y1, 0)
			.Transform ("Shape", "Translate")
			.MultipleObjects (True)
		End With



		x2 = (offset+a*Sqr(2*d*(N+0.5)/a))*Cos(Sqr(2*d*(N+0.5)/a))
		y2 = (offset+a*Sqr(2*d*(N+0.5)/a))*Sin(Sqr(2*d*(N+0.5)/a))

		With Transform
			.Name "Tx_antenna:Tx_patch"
			.AddName "Tx_feed:tx_v"
			.AddName "Tx_feed:tx_h"
			.Vector (x2, y2, 0)
			.Transform ("Shape", "Translate")
			.MultipleObjects (True)
		End With

	Next



End Sub
