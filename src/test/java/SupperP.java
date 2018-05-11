import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;


public class SupperP {
	/** 请完成下面这个函数，实现题目要求的功能 **/
	 /** 当然，你也可以不按照这个模板来作答，完全按照自己的想法来 ^-^  **/
	    static int findCircleNum(int[][] M) {
			
	    	List <List<Integer>> team= new LinkedList<>();
	    	List <List<Integer>> resultTeam= new LinkedList<>();
	    	
	    	for (int i = 0; i < M.length; i++) {
				List< Integer > lst=new LinkedList<>();
				for (int j = 0; j < M.length; j++) {
					if(M[i][j]==1 || M[j][i]==1){
						if (!lst.contains(j)) {
							lst.add(j);
						}
					}
				}
			}
	    	
	    	
	    	for (List<Integer> lstI : team) {
	    		
	    		for (Integer integer : lstI) {
	    			for (List<Integer> lst : resultTeam) {
		    			if (resultTeam.contains(integer)) {
							continue;
						}
					}
				}
	    		
	    		List< Integer> lst = new LinkedList<>();
	    		lst.addAll(lstI);
	    		for (Integer iterm : lst) {
	    			for (List<Integer> j : team) {
						if (j.contains(iterm)) {
						
							for (Integer integer : j) {
								if (!lst.contains(integer)) {
									lst.add(integer);
								}
							}
						}
					}
				}
	    		resultTeam.add(lst);
			}
	    	return resultTeam.size();


	    }

	    
	    
	    public static void main(String[] args){
	        Scanner in = new Scanner(System.in);
	        int res;

	        int _M_rows = 0;
	        int _M_cols = 0;
	        _M_rows = Integer.parseInt(in.nextLine().trim());
	        _M_cols = Integer.parseInt(in.nextLine().trim());

	        int[][] _M = new int[_M_rows][_M_cols];
	        for(int _M_i=0; _M_i<_M_rows; _M_i++) {
	            String row_x=String.valueOf(in.nextLine().trim());
	            String[] row_y=row_x.split(",");
	            for(int _M_j=0; _M_j<_M_cols; _M_j++) {
	                _M[_M_i][_M_j] = Integer.parseInt(row_y[_M_j]);

	            }
	        }

	        if(in.hasNextLine()) {
	            in.nextLine();
	        }

	        res = findCircleNum(_M);
	        System.out.println(String.valueOf(res));

	    }
	}