/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package enetwork;

import java.security.MessageDigest;

/**
 *
 * @author Akshar
 */
public class MD5 {

    static MessageDigest md;

    public String hash(String s) {
        String hexString = new String();
        try {
            md = MessageDigest.getInstance("md5");
            byte in[] = (s).getBytes();
            md.update(in);
            for(int i=0;i<in.length;i++)
                {
                    hexString=hexString+Integer.toHexString(in[i]);
                }
        }
        catch (Exception e) {
        }
        return hexString;
    }
}
