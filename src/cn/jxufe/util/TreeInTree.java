package cn.jxufe.util;

import java.util.List;

import cn.jxufe.domain.TreeNode;


/**
 * 楼中楼，层中层，使用递归算法结合数据库解析成java树形结构
 * @author Administrator
 *	
 */
public class TreeInTree {

	
	/**
	* 递归算法解析成树形结构
	*
	* @param cid孩子节点 pid 父节点
	* @return 返回一颗评论树
	* @author zcd
	*/
	public TreeNode recursiveTree(int cid) {
	//根据cid获取节点对象(SELECT * FROM tb_tree t WHERE t.cid=?)
	//TreeNode node = personService.getreeNode(cid);
	//查询cid下的所有子节点(SELECT * FROM tb_tree t WHERE t.pid=?)
	//List childTreeNodes = personService.queryTreeNode(cid); 
	//遍历子节点
	//for(TreeNode child : childTreeNodes){
	//TreeNode n = recursiveTree(child.getCid()); //递归
	//node.getNodes().add(n);
	//}
	 
	//return node;
	return null;
	}
}
