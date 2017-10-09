package Lab2;


public class Point {
    private double x;
    private double y;
    private  int r;
    private boolean isInArea;
    Point(double x,double y, int r){
        this.x=x;
        this.y=y;
        this.r=r;
        isInArea = checkArea(x,y,r);
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public int getR() {
        return r;
    }

    public boolean isInArea() {
        return isInArea;
    }

    public void setInArea(boolean inArea) {
        isInArea = inArea;
    }

    public void setR(int r) {
        this.r = r;
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public static boolean checkArea(double x,double y,int R){
        if(x<=0&&y<=0&&y>=-2*x-R){
            return true;
        }
        if(x<=0&&y>=0&&(y*y+x*x<=(double)R/2*R/2)&&(x>=-(double)R/2)&&(y<=(double)R/2)){
            return true;
        }
        if(x>=0&&y<=0&&x<=R&&y>=-R){
            return true;
        }
        return false;
    }
}