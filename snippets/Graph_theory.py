# this script is introdusing some of the graph theory concepts
# without using networkx library

import typing as tp
from collections import deque
class Graph_theory:
    def __init__(self) -> None:
        pass
        
    def create_adjMatrix(edges:tuple)->tp.List[tp.List[int]]:
        # DFS
        n = len(edges)
        adj = [[] for _ in range(n)]
        for a, b in edges:
            a -= 1
            b -= 1
            adj[a].append(b)
            adj[b].append(a)
        
        return adj

    def dfs(cNode, adjM:tp.List[tp.List[int]], vis:set):
        if vis[cNode]: return 0
        vis[cNode] = True
        N = 1
        for next_node in adjM[cNode]:
            N += Graph_theory.dfs(next_node)

        return N

    def bfs( adjM:tp.List[tp.List[int]],startNode:int)->tp.List[int]:
        # Write your code here
        n=len(adjM)
        Vis=set()
        q=deque()
        q.append((startNode-1,0))
        Dis=[-1]*n
        while q:
            p,M=q.popleft() 
            if p in Vis: continue

            Dis[p]=M
            Vis.add(p)
            M+=6
            for j in adjM[p]:
                q.append((j,M))

        return Dis