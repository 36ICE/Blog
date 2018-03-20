package cn.jxufe.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TreeNode implements Serializable {
private Integer cid;
private String cname;
private String context;
private Integer pid;
private List nodes = new ArrayList();
 
public TreeNode() {
}
 

}