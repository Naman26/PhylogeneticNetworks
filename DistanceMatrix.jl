aList = [0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 1 1 0 0 1; 0 0 1 0 1 0 0 1; 0 0 0 0 0 1 1 0]
visited=[]
distMatrix= copy(aList)
depth=0

function setAdjacencyList(adjList)
    aList = adjList
    distMatrix =  copy(aList)
    println("distMatrix", distMatrix)
end

function distFunc(list, inNode,firstNode)
    global depth+=1
    vals= collect(i for i=firstNode+1: length(list[:,1]) if list[inNode,i]==1)
    for p in visited
        filter!(x -> x!=p,vals)
    end
    append!(visited, inNode)
    if length(vals)==0
        global depth-=1
        return
    else

        for j in vals
            if(distMatrix[firstNode, j]==0)
                distMatrix[firstNode, j]= depth
                distMatrix[j,firstNode]= depth
                distMatrix[inNode, j]= 1
                distMatrix[j,inNode]= 1
            end
            if !(j in visited)
               distFunc(list, j, firstNode)
            end
        end
    end
end

for i=1:length(aList[:,1])
    visited=[]
    depth=0
    distFunc(aList, i, i)
end

function returnDistMat()
     return distMatrix
end