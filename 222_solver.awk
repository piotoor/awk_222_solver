function printArray(tab,   i)
{
    len = arrayLength(tab);
    for(i = 0; i < len; i++)
    {
        printf("%d", tab[i]);
        if(i < len-1)
        {
            printf(" ");
        }
    }
    #printf("\n");
}
function arrayLength(tab,   k, i)
{
    k = 0; 
  for( i in tab) 
    {
        k++
    } 
  return k;
}
function arraySum(tab,   sum, i)
{
    sum = 0;
    for(i in tab)
    {
        sum += tab[i];
    }
    return sum;
}
# Cube-related functions
function printCube()
{
    #printf("Whole cube: \n");
    #printArray(CubeState);
    #printf("Orientation: \n");
    printf("CO: ");
    #extractOrientation(CubeState, CO);
    printArray(CO);
    printf("\tCP: ");
    #printf("Permutation: \n");
    #extractPermutation(CubeState, CP);
    printArray(CP);
    printf("\n");
}
function extractOrientation(CubeState, CO,   i)
{
    for(i = 0; i < 8; i++)
    {
        CO[i] = CubeState[i] - int(CubeState[i]/6)*6;
    }
}
function extractPermutation(CubeState, CP,   i)
{
    for(i = 0; i < 8; i++)
    {
        CP[i] = CubeState[i]/6;
    }
}

function resetCube(CubeState,   i)
{
    for(i = 0; i < 8; i++)
    {
        CubeState[i] = i*6;
    }
}
function isCPValid(CP,   i, k)
{
    k = 0;
    for(i = 0; i < 8; i++)
    {
        taken[i] = -1;
    }
    if(arrayLength(CP) != 8)
    {
        #print "length";
        return 0;
    }
    for(i = 0; i < 8; i++)
    {
        if((CP[i] > 7) || (CP[i] < 0))
        {
            #print "Range";
            return 0;
        }
        for(j = 0; j < 8; j++)
        {
            if(taken[j] == CP[i])
            {
                #print "dupa " i " " j;
                return 0;
            }
        }
        taken[k++] = CP[i];
    }
    return (CP[7] == 7);
}
function isCOValid(CO,   i)
{
    if(arrayLength(CO) != 8)
    {
        return 0;
    }
    for(i = 0; i < 8; i++)
    {
        if((CO[i] > 2) || (CO[i] < 0))
        {
            return 0;
        }
    }
    return (arraySum(CO) % 3 == 0);
}
function isCubeValid()
{
    return (isCOValid(CO) && isCPValid(CP));
}
function implodeCOCP(CubeState, CO, CP,   i)
{
    for(i = 0; i < 8; i++)
    {
        CubeState[i] = CP[i]*6 + CO[i];
    }
}

function isSolved(CubeState,   i)
{
    for(i = 0; i < 7; i++)
    {
        #print CubeState[i] "    " ix6[i]
        if(CubeState[i] != ix6[i])
        {
            return 0;
        }
    }
    return 1;
}
function U()
{
    tmp = CubeState[0];
    CubeState[0] = CubeState[3];
    CubeState[3] = CubeState[2];
    CubeState[2] = CubeState[1];
    CubeState[1] = tmp;
}
function U2()
{
    tmp = CubeState[0];
    CubeState[0] = CubeState[2];
    CubeState[2] = tmp;
    tmp = CubeState[1];
    CubeState[1] = CubeState[3];
    CubeState[3] = tmp;
}
function Ui()
{
    tmp = CubeState[0];
    CubeState[0] = CubeState[1];
    CubeState[1] = CubeState[2];
    CubeState[2] = CubeState[3];
    CubeState[3] = tmp;
}
function L()
{
    tmp = normalize[CubeState[1] + 1];
    CubeState[1] = normalize[CubeState[2] + 2];
    CubeState[2] = normalize[CubeState[6] + 1];
    CubeState[6] = normalize[CubeState[5] + 2];
    CubeState[5] = tmp;
}
function L2()
{
    tmp = CubeState[1];
    CubeState[1] = CubeState[6];
    CubeState[6] = tmp;
    tmp = CubeState[2];
    CubeState[2] = CubeState[5];
    CubeState[5] = tmp;
}
function Li()
{
    tmp = normalize[CubeState[1] + 1];
    CubeState[1] = normalize[CubeState[5] + 2];
    CubeState[5] = normalize[CubeState[6] + 1];
    CubeState[6] = normalize[CubeState[2] + 2];
    CubeState[2] = tmp;
}
function F()
{
    tmp = normalize[(CubeState[0] + 1)];
    CubeState[0] = normalize[(CubeState[1] + 2)];
    CubeState[1] = normalize[(CubeState[5] + 1)];
    CubeState[5] = normalize[(CubeState[4] + 2)];
    CubeState[4] = tmp;
}
function F2()
{
    tmp = CubeState[0];
    CubeState[0] = CubeState[5];
    CubeState[5] = tmp;
    tmp = CubeState[1];
    CubeState[1] = CubeState[4];
    CubeState[4] = tmp;
}
function Fi()
{
    tmp = normalize[CubeState[0] + 1];
    CubeState[0] = normalize[CubeState[4] + 2];
    CubeState[4] = normalize[CubeState[5] + 1];
    CubeState[5] = normalize[CubeState[1] + 2];
    CubeState[1] = tmp;
}
function move(ind)
{
    if(ind == 0)
        U();
    else if(ind == 1)
        U2();
    else if(ind == 2)
        Ui();
    else if(ind == 3)
        F();
    else if(ind == 4)
        F2();
    else if(ind == 5)
        Fi();
    else if(ind == 6)
        L();
    else if(ind == 7)
        L2();
    else
        Li();
}
function moveInv(ind)
{
    if(ind == 2)
        U();
    else if(ind == 1)
        U2();
    else if(ind == 0)
        Ui();
    else if(ind == 5)
        F();
    else if(ind == 4)
        F2();
    else if(ind == 3)
        Fi();
    else if(ind == 8)
        L();
    else if(ind == 7)
        L2();
    else
        Li();
}

function solveIter(depth, prevMove,   i)
{
    if(depth == 0)
    {
        if(isSolved(CubeState))
        {
            return 1;
        }
        return 0;
    }
    else
    {
        for(i = 0; i < 9; i++)
        {
            if((idiv3[i]) == (idiv3[prevMove]))
            {
                continue;
            }
            move(i);
            #print "move: " indexToChar(i) "------------------------------";
            #printCube();
            #solution[iDepth-depth] = i;
            solution[depth] = i;
            if(solveIter(depth-1, i))
            {
                return 1;
            }
            moveInv(i);
        }
    }    
    return 0;
}
function invertSolution(iDepth,   i)
{
    for(i = iDepth; i >=0; i--)
    {
        res[iDepth-i] = solution[i];    
    }
    clearSolution();
    for(i = 0; i <= iDepth; i++)
    {
        solution[i] = res[i];
    }
}
function clearSolution(   i)
{
    for(i = 0; i < 12; i++)
    {
        solution[i] = -1;
    }
}
function solve(min, max, cube)
{
    implodeCOCP(CubeState, CO, CP,   i);
    #print "-------------------------------- Solve() START --------------------------------";
    #printf("--------------------------- Cube %d ---------------------------\n", cube);
    #printf ("\n");
    #printCube();
    for(iDepth = min; iDepth <= max; iDepth++)
    {
        printf("\rDepth %d...", iDepth);
        clearSolution();
        #resetCube(CubeState);
        #scrambleCube();
        if(solveIter(iDepth, -1))
        {
            printf("\rSolution: ");
            invertSolution(iDepth);
            printSolution(iDepth);
            break;
        }
    }
    #print "-------------------------------- Solve()  END  --------------------------------";
}
function indexToChar(ind)
{
    if(ind == 0)
        return "U";
    else if(ind == 1)
        return "U2";
    else if(ind == 2)
        return "Ui";
    else if(ind == 3)
        return "F";
    else if(ind == 4)
        return "F2";
    else if(ind == 5)
        return "Fi";
    else if(ind == 6)
        return "L";
    else if(ind == 7)
        return "L2";
    else if(ind == 8)
        return "Li";
    else 
        return "--";
}
function charToIndex(str)
{
    if(str == "U")
        return 0;
    else if(str == "U2")
        return 1;
    else if(str == "Ui")
        return 2;
    else if(str == "F")
        return 3;
    else if(str == "F2")
        return 4;
    else if(str == "Fi")
        return 5;
    else if(str == "L")
        return 6;
    else if(str == "L2")
        return 7;
    else if(str == "Li")
        return 8;
    else
        return -1;
}
function printSolution(len,   i)
{
    for(i = 0; i < len; i++)
    {
        printf("%s ", indexToChar(solution[i]));
    }
    printf("\n");
}
function scrambleCube()
{
    Fi();
    Li();
    Ui();
    L();
    U();
    Li();
    Ui();
    L();
    U();
    F();
    Ui();
    Fi();
}
function debugSingleMoves()
{
    print "U --------------------------------------";
    resetCube(CubeState);
    print "isSolved(): " isSolved(CubeState)
    printCube();
    U();
    printCube();
    print "isSolved(): " isSolved(CubeState)

    print "U2 --------------------------------------";
    resetCube(CubeState);
    printCube();
    U2();
    printCube();

    print "Ui --------------------------------------";
    resetCube(CubeState);
    printCube();
    Ui();
    printCube();

    print "L --------------------------------------";
    resetCube(CubeState);
    printCube();
    L();
    printCube();

    print "L2 --------------------------------------";
    resetCube(CubeState);
    printCube();
    L2();
    printCube();

    print "Li --------------------------------------";
    resetCube(CubeState);
    printCube();
    Li();
    printCube();

    print "F --------------------------------------";
    resetCube(CubeState);
    printCube();
    F();
    printCube();

    print "F2 --------------------------------------";
    resetCube(CubeState);
    printCube();
    F2();
    printCube();

    print "Fi --------------------------------------";
    resetCube(CubeState);
    printCube();
    Fi();
    printCube();
    

    resetCube();
}
function debugScrambleSolve()
{
    resetCube(CubeState);
    #printCube();
    scrambleCube(); # For debugging purpose only
    solve(0, 11, 0);
    #printCube();
}
function initializeConstants()
{
# Global consts------------------------
    normalize[0] = 0;
    normalize[1] = 1;
    normalize[2] = 2;
    normalize[3] = 0;
    normalize[4] = 1;

    normalize[6] = 6;
    normalize[7] = 7;
    normalize[8] = 8;
    normalize[9] = 6;
    normalize[10] = 7;

    normalize[12] = 12;
    normalize[13] = 13;
    normalize[14] = 14;
    normalize[15] = 12;
    normalize[16] = 13;

    normalize[18] = 18;
    normalize[19] = 19;
    normalize[20] = 20;
    normalize[21] = 18;
    normalize[22] = 19;

    normalize[24] = 24;
    normalize[25] = 25;
    normalize[26] = 26;
    normalize[27] = 24;
    normalize[28] = 25;

    normalize[30] = 30;
    normalize[31] = 31;
    normalize[32] = 32;
    normalize[33] = 30;
    normalize[34] = 31;

    normalize[36] = 36;
    normalize[37] = 37;
    normalize[38] = 38;
    normalize[39] = 36;
    normalize[40] = 37;

    normalize[42] = 42;
    normalize[43] = 43;
    normalize[44] = 44;
    normalize[45] = 42;
    normalize[46] = 43;

    ix6[0] = 0;
    ix6[1] = 6;
    ix6[2] = 12;
    ix6[3] = 18;
    ix6[4] = 24;
    ix6[5] = 30;
    ix6[6] = 36;
    ix6[7] = 42;

    idiv3[0] = 0;
    idiv3[1] = 0;
    idiv3[2] = 0;
    idiv3[3] = 1;
    idiv3[4] = 1;
    idiv3[5] = 1;
    idiv3[6] = 2;
    idiv3[7] = 2;
    idiv3[8] = 2;
    # ------------------------------------
}

function parseCOCP(   i)
{
    for(i = 1; i <= 8; i++)
    {
        CO[i - 1] = $i;
    }
    for(i = 9; i <= NF; i++)
    {
        CP[i - 9] = $i;
    }
}
function isInputValid()
{
    if(NF != 16)
    {
        return 0;
    }
    parseCOCP();
    #printArray(CO);
    #print "\n";
    #printArray(CP);
    #print "\n";
    #printCube();
    return isCubeValid();
}
#    
BEGIN{

    initializeConstants();
    #debugScrambleSolve();
}

{
    if(isInputValid())
    {
        print "Cube " NR;
        print $0;
        print "|<-----CO----->|<-----CP----->|" 
        solve(0, 12, NR);
    }
    else
    {
        print "Cube " NR;
        print $0 "\nInvalid input data. Cannot solve, sorry.";
    }
    printf("\n");
}
NR == 5 {printf("-------------------------------\n");}
END {
    printf ("Summary TODO\n");
    exit 5;
}
