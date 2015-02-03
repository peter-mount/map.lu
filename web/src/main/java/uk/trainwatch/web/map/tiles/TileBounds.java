/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.trainwatch.web.map.tiles;

import java.util.HashMap;
import java.util.Map;

/**
 * Utility class which holds the bounds for the UK
 * <p/>
 * @author peter
 */
public final class TileBounds
{

    private TileBounds()
    {
    }

    private static final int BOUNDS[][] = new int[][]
    {
        {
            0, 0, 0, 0, 0
        },
        {
            1, 0, 1, 0, 1
        },
        {
            2, 0, 3, 0, 3
        },
        {
            3, 0, 7, 0, 7
        },
        {
            4, 6, 9, 3, 6
        },
        {
            5, 13, 17, 7, 11
        },
        {
            6, 29, 32, 18, 21
        },
        {
            7, 59, 65, 34, 43
        },
        {
            8, 118, 129, 72, 88
        },
        {
            9, 236, 258, 146, 176
        },
        {
            10, 473, 517, 292, 352
        },
        {
            11, 944, 1035, 585, 704
        },
        {
            12, 1892, 2068, 1169, 1404
        },
        {
            13, 3784, 4136, 2339, 2807
        },
        {
            14, 7568, 8272, 4678, 5615
        },
        {
            15, 15137, 16544, 9357, 11231
        },
        {
            16, 30275, 33089, 18715, 22461
        },
        {
            17, 60552, 66177, 37431, 44924
        },
        {
            18, 121104, 132356, 74864, 89848
        }
    };
    private static final Map<Integer, int[]> bounds = new HashMap<>();

    static
    {
        for( int z = 0; z < BOUNDS.length; z++ )
        {
            bounds.put( z, BOUNDS[z] );
        }
    }

    private static void assertZoom( int zoom )
    {
        if( zoom < 0 || zoom > 18 )
        {
            throw new IllegalArgumentException( "Invalid Zoom " + zoom );
        }
    }

    public static int getAbsoluteMax( int zoom )
    {
        return (2 ^ zoom) - 1;
    }

    public static int getXmin( int zoom )
    {
        assertZoom( zoom );
        return bounds.get( zoom )[1];
    }

    public static int getXmax( int zoom )
    {
        assertZoom( zoom );
        return bounds.get( zoom )[2];
    }

    public static int getYmin( int zoom )
    {
        assertZoom( zoom );
        return bounds.get( zoom )[3];
    }

    public static int getYmax( int zoom )
    {
        assertZoom( zoom );
        return bounds.get( zoom )[4];
    }

}
